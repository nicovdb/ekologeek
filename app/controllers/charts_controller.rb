class ChartsController < ApplicationController

  layout "charts"

  def index
    @articles = Article.where(visibility: [:intern, :both], published: true).reverse.first(3)
    @topics = Topic.all.reverse.first(3)
    @companies = Company.all

    #données des séries pour le graphique récapitulatif de chaque structure
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name AS type, status FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql).to_a

    series_by_day
    weight_evolution


    #les données pour le graphique spécial admin avec toutes les structures
    admin_sql = "SELECT start_at, end_at, weight_person_day, companies.name AS company, bin_types.name AS type, status FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN projects ON projects.id = companies.project_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE projects.id = #{current_user.company.project.id}"
    @admin_collects = ActiveRecord::Base.connection.execute(admin_sql)
    @companies_collects = @admin_collects.group_by { |collect| collect["company"]}
    @types_collects = @admin_collects.group_by { |collect| collect["type"]}

    series_by_day_admin
    admin_weight_evolution
    admin_residual_trash
    bilan_results

  end


  def show
    @company = Company.find(params[:id])

    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name AS type, status FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{@company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    @types_collects = @collects.group_by { |collect| collect["type"]}

    series_by_day
    residual_trash
    weight_evolution
  end

  private

  def bilan_results
    #mis chaque collecte au jour le jour par entreprise
    collects_per_day_companies = []
    @companies_collects.each do |company_collects|
      collects_per_day_company = []
      company_collects.last.each do |collect|
        days = collect["end_at"].to_date - collect["start_at"].to_date
        start_at = collect["start_at"].to_date
        days.to_i.times do
          collects_per_day_company << {"start_at"=>start_at.to_s,
            "weight_person_day"=>collect["weight_person_day"],
            "type"=>collect["type"]
          }
          start_at += 1
        end
      end
      collects_per_day_companies << {company_collects.first => collects_per_day_company}
    end

    #calcul poids résiduel
    collects_per_type_companies = []
    @companies_collects.each do |company_collects|
      collects_per_type_company = []
      company_collects.last.each do |collect|
        days = collect["end_at"].to_date - collect["start_at"].to_date
        weight = collect["weight_person_day"] * days
        collects_per_type_company << {
          "weight"=>weight,
          "type"=>collect["type"],
          "status"=>collect["status"]
        }
      end
      collects_per_type_companies << {company_collects.first => collects_per_type_company}
    end

    bilan_results = []
    collects_per_type_companies.each do |company|
      residual_weight_diag = 0
      total_weight_diag = 0
      residual_weight_bilan = 0
      total_weight_bilan = 0
      company.values.first.each do |collect|
        if collect["status"] == "diagnostic"
          total_weight_diag += collect["weight"]
          if collect["type"] == "Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)"
            residual_weight_diag += collect["weight"]
          end
        elsif collect["status"] == "bilan"
          total_weight_bilan += collect["weight"]
          if collect["type"] == "Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)"
            residual_weight_bilan += collect["weight"]
          end
        end
      end

      if total_weight_diag == 0 && total_weight_bilan == 0
        bilan_results << {
          company.first.first => {
            residual_diag: 0,
            residual_bilan: 0
          }
        }
      elsif total_weight_diag == 0
        bilan_results << {
          company.first.first => {
            residual_diag: 0,
            residual_bilan: residual_weight_bilan/total_weight_bilan *100
          }
        }
      elsif total_weight_bilan == 0
        bilan_results << {
          company.first.first => {
            residual_diag: residual_weight_diag/total_weight_diag *100,
            residual_bilan: 0
          }
        }
      else
        bilan_results << {
          company.first.first => {
            residual_diag: residual_weight_diag/total_weight_diag *100,
            residual_bilan: residual_weight_bilan/total_weight_bilan *100
          }
        }
      end
    end

    #total par jour et par entreprise
    collects_per_day_companies_grouped = []
    collects_per_day_companies.each do |company|
      collects_per_day_companies_grouped << {
        company.first.first => company.values.first.group_by {|collect| collect["start_at"]}
      }
    end

    collects_per_day_companies_grouped.each do |company|
      company.values.first.each do |day|
        day[1].map! { |collect| collect["weight_person_day"] }
      end
    end

    #poids par collab par jour diagnostic et bilan par entreprise
    collects_per_day_companies_grouped.each do |company|
      diagnostic_weight = 0
      diagnostic_days = 0
      bilan_weight = 0
      bilan_days = 0
      company.values.first.each do |day|
        if day.first.to_date <= current_user.company.project.diagnostic_end_at
          diagnostic_weight += day.last.first
          diagnostic_days += 1
        elsif day.first.to_date >= current_user.company.project.bilan_start_at
          bilan_weight += day.last.first
          bilan_days += 1
        end
      end
      if bilan_days == 0 && diagnostic_days == 0
        bilan_results << {
          company.first.first => {
            "diagnostic": 0,
            "bilan": 0
          }
        }
      elsif bilan_days == 0
        bilan_results << {
          company.first.first => {
            "diagnostic": diagnostic_weight/diagnostic_days,
            "bilan": 0
          }
        }
      elsif diagnostic_days == 0
        bilan_results << {
          company.first.first => {
            "diagnostic": 0,
            "bilan": bilan_weight/bilan_days
          }
        }
      else
        bilan_results << {
          company.first.first => {
            "diagnostic": diagnostic_weight/diagnostic_days,
            "bilan": bilan_weight/bilan_days
          }
        }
      end
    end
    @bilan_results_done = bilan_results.group_by {|result| result.keys}
  end

  def weight_evolution
    #calcul du poids des déchets lors du diag pour 1 entreprise
    @diag_collects = @collects.select { |collect| collect["status"] == "diagnostic" }
    @diag_collects_weight = 0
    @diag_total_days = 0
    @diag_collects.each do |collect|
      @diag_collects_weight += (collect["end_at"].to_date - collect["start_at"].to_date) * collect["weight_person_day"]
      @diag_total_days += collect["end_at"].to_date - collect["start_at"].to_date
    end

    #calcul du poids des déchets lors du suivi pour 1 entreprise
    @current_collects = @collects.select { |collect| collect["status"] == "suivi" }
    @current_collects_weight = 0
    @current_total_days = 0
    @current_collects.each do |collect|
      @current_collects_weight += (collect["end_at"].to_date - collect["start_at"].to_date) * collect["weight_person_day"]
      @current_total_days += collect["end_at"].to_date - collect["start_at"].to_date
    end

    if @current_total_days != 0 && @diag_total_days != 0 && @current_collects_weight != 0 && @diag_collects_weight != 0
      @weight_evolution = ((((@current_collects_weight / @current_total_days) - (@diag_collects_weight / @diag_total_days)) / (@current_collects_weight / @current_total_days))*100).round
    else
      @weight_evolution = 0
    end

    # #poids de la dernière collecte
    # last_collect = current_user.company.collects.sort { |a, b| [a['end_at'], a['id']] <=> [b['end_at'], b['id']] }.last
    # last_collect_weight = (last_collect["end_at"] - last_collect["start_at"]) * last_collect["weight_person_day"]

    # #calcul de l'évolution
    # if @diag_collects_weight != 0 && last_collect_weight != 0
    #   @weight_evolution = (((last_collect_weight - @diag_collects_weight)/@diag_collects_weight) *100).round
    # else
    #   @weight_evolution = 0
    # end

  end


  def admin_weight_evolution
    #calcul du poids des déchets lors du diag pour 1 entreprise
    @diag_collects = @admin_collects.select { |collect| collect["status"] == "diagnostic" }
    @diag_collects_weight = 0
    @diag_total_days = 0
    @diag_collects.each do |collect|
      @diag_collects_weight += (collect["end_at"].to_date - collect["start_at"].to_date) * collect["weight_person_day"]
      @diag_total_days += collect["end_at"].to_date - collect["start_at"].to_date
    end

    #calcul du poids des déchets lors du suivi pour 1 entreprise
    @current_collects = @admin_collects.select { |collect| collect["status"] == "suivi" }
    @current_collects_weight = 0
    @current_total_days = 0
    @current_collects.each do |collect|
      @current_collects_weight += (collect["end_at"].to_date - collect["start_at"].to_date) * collect["weight_person_day"]
      @current_total_days += collect["end_at"].to_date - collect["start_at"].to_date
    end

    if @current_total_days != 0 && @diag_total_days != 0 && @current_collects_weight != 0 && @diag_collects_weight != 0
      @admin_weight_evolution = ((((@current_collects_weight / @current_total_days) - (@diag_collects_weight / @diag_total_days)) / (@current_collects_weight / @current_total_days))*100).round
    else
      @admin_weight_evolution = 0
    end

   #poids de la dernière collecte
    # last_collect = Collect.all.sort { |a, b| [a['end_at'], a['id']] <=> [b['end_at'], b['id']] }.last
    # last_collect_weight = (last_collect["end_at"] - last_collect["start_at"]) * last_collect["weight_person_day"]

    # #calcul de l'évolution
    # if @diag_collects_weight != 0 && last_collect_weight != 0
    #   @admin_weight_evolution = (((last_collect_weight - @diag_collects_weight)/@diag_collects_weight) *100).round
    # else
    #   @admin_weight_evolution = 0
    # end



  end

  def series_by_day_admin
    @collects_per_day_admin = []
    @admin_collects.to_a.each do |collect|
      days = collect["end_at"].to_date - collect["start_at"].to_date
      start_at = collect["start_at"].to_date
      days.to_i.times do
        @collects_per_day_admin << {"start_at"=>start_at.to_s,
          "end_at"=>start_at.to_s,
          "weight_person_day"=>collect["weight_person_day"],
          "type"=>collect["type"]}
        start_at += 1
      end
    end

    @day_group = @collects_per_day_admin.group_by {|collect| collect["start_at"]}

    @day_group.each do |day|
      day[1].map! {|collect| collect["weight_person_day"]}
    end

    data = []
    @day_group.each do |day|
      data << {
        x: (day.first.to_time.to_i * 1000 + 3600000),
        y: day[1].sum
      }
    end

    @serie_total = {name: "Total", data: data}

    @collects_per_day_sums_admin = []
    @grouped_collects_admin = @collects_per_day_admin.group_by {|collect| collect["type"]}
    @grouped_collects_admin.each do |type_collects|
      type_collects[1].group_by {|type_collect| type_collect["start_at"]}.each do |day|
        if day[1].count == 1
          @collects_per_day_sums_admin << day[1]
        else
          total_weight = day[1].sum {|date| date["weight_person_day"]}
          @collects_per_day_sums_admin << [{"start_at"=> day[1][0]["start_at"],
            "end_at"=>day[1][0]["end_at"],
            "weight_person_day"=> total_weight,
            "type"=> day[1][0]["type"]
          }]
        end
      end
    end

    @collects_per_day_sums_admin = @collects_per_day_sums_admin.flatten.group_by {|collect| collect["type"]}
    @series_admin = @collects_per_day_sums_admin.map do |type_collects|
      data = type_collects[1].map do |type_collect|
        {
          x: (type_collect["start_at"].to_time.to_i * 1000 + 3600000),
          y: type_collect["weight_person_day"]
        }
      end
      {
        name: type_collects.first,
        data: data
      }
    end

    @series_admin << @serie_total

    @series_admin.each do |serie|
      serie[:data].sort_by! do |data|
        data[:x]
      end
    end
  end

  def series_by_day
    @collects_per_day = []

    @collects.each do |collect|
      days = collect["end_at"].to_date - collect["start_at"].to_date
      start_at = collect["start_at"].to_date
      days.to_i.times do
        @collects_per_day << {"start_at"=>start_at.to_s,
          "end_at"=>start_at.to_s,
          "weight_person_day"=>collect["weight_person_day"],
          "type"=>collect["type"]}
        start_at += 1
      end
    end

    @day_group = @collects_per_day.group_by {|collect| collect["start_at"]}

    @day_group.each do |day|
      day[1].map! {|collect| collect["weight_person_day"]}
    end

    data = []
    @day_group.each do |day|
      data << {
        x: (day.first.to_time.to_i * 1000 + 3600000),
        y: day[1].sum
      }
    end

    @serie_total = {name: "Total", data: data}

    @collects_per_day_sums = []
    @grouped_collects = @collects_per_day.group_by {|collect| collect["type"]}
    @grouped_collects.each do |type_collects|
      type_collects[1].group_by {|type_collect| type_collect["start_at"]}.each do |day|
        if day[1].count == 1
          @collects_per_day_sums << day[1]
        else
          total_weight = day[1].sum {|date| date["weight_person_day"]}
          @collects_per_day_sums << [{"start_at"=> day[1][0]["start_at"],
            "end_at"=>day[1][0]["end_at"],
            "weight_person_day"=> total_weight,
            "type"=> day[1][0]["type"]
          }]
        end
      end
    end

    @collects_per_day_sums = @collects_per_day_sums.flatten.group_by {|collect| collect["type"]}

    @series = @collects_per_day_sums.map do |type_collects|
      data = type_collects[1].map do |type_collect|
        {
          x: (type_collect["start_at"].to_time.to_i * 1000 + 3600000),
          y: type_collect["weight_person_day"]
        }
      end
      {
        name: type_collects.first,
        data: data
      }
    end

    @series << @serie_total

    @series.each do |serie|
      serie[:data].sort_by! do |data|
        data[:x]
      end
    end
  end

  def admin_residual_trash
    @total_weight_per_company = 0
    @residual_trash = 0
    @days_and_weight_per_type_per_person = @types_collects.map {|type_collects|
      days = 0
      weight = 0
      type_collects[1].map { |type_collect|
        days += (type_collect["end_at"].to_date - type_collect["start_at"].to_date)
        weight += ((type_collect["end_at"].to_date - type_collect["start_at"].to_date) * type_collect["weight_person_day"])
      }
      @total_weight_per_company += weight
      if type_collects.first == "Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)"
        @residual_trash = weight
      end
      [type_collects.first, days, weight]
    }

    #calculs de poids moyens pour recap par entreprise (pour admin)
    @total_weight = 0
    @admin_residual_trash = 0
    @days_and_weight_per_company_per_person = @companies_collects.map {|company_collects|
      days = 0
      weight = 0
      company_collects[1].map { |company_collect|
        days += (company_collect["end_at"].to_date - company_collect["start_at"].to_date)
        weight += ((company_collect["end_at"].to_date - company_collect["start_at"].to_date) * company_collect["weight_person_day"])
        if company_collect["type"] == "Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)"
          @admin_residual_trash += ((company_collect["end_at"].to_date - company_collect["start_at"].to_date) * company_collect["weight_person_day"])
        end
      }
      @total_weight += weight
      [company_collects.first, days, weight]
    }
  end

  def residual_trash
    @total_weight_per_company = 0
    @residual_trash = 0
    @days_and_weight_per_type_per_person = @types_collects.map {|type_collects|
      days = 0
      weight = 0
      type_collects[1].map { |type_collect|
        days += (type_collect["end_at"].to_date - type_collect["start_at"].to_date)
        weight += ((type_collect["end_at"].to_date - type_collect["start_at"].to_date) * type_collect["weight_person_day"])
      }
      @total_weight_per_company += weight
      if type_collects.first == "Ordures ménagères résiduelles (Bordeaux Métropole : bac noir)"
        @residual_trash = weight
      end
      [type_collects.first, days, weight]
    }

    respond_to do |format|
      format.html {redirect_to chart_path(@company.id)}
      format.js
    end
  end
end
