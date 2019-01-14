class ChartsController < ApplicationController

  layout "charts"

  def index
    @companies = Company.all
    #données des séries pour le graphique récapitulatif de chaque structure
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name AS type FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql).to_a
    @types_collects = @collects.group_by { |collect| collect["type"]}
    @series = @types_collects.map do |type_collects|
      data = type_collects[1].map do |type_collect|
        {
          x: (type_collect["start_at"].to_time.to_i * 1000 + 3600000),
          x2: (type_collect["end_at"].to_time.to_i * 1000 + 3600000),
          y: type_collect["weight_person_day"]
        }
      end
      {
        name: type_collects.first,
        data: data
      }
    end

    #les données pour le graphique spécial admin avec toutes les structures
    admin_sql = "SELECT start_at, end_at, weight_person_day, companies.name AS company, bin_types.name AS type FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN projects ON projects.id = companies.project_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE projects.id = #{current_user.company.project.id}"
    @admin_collects = ActiveRecord::Base.connection.execute(admin_sql)
    @companies_collects = @admin_collects.group_by { |collect| collect["company"]}
    @admin_series = @companies_collects.map { |company_collects|
      data = company_collects[1].map { |company_collect|
        {
          x: (company_collect["start_at"].to_time.to_i * 1000 + 3600000),
          x2: (company_collect["end_at"].to_time.to_i * 1000 + 3600000),
          y: company_collect["weight_person_day"],
          type: company_collect["type"]
        }
      }
      {
        name: company_collects.first,
        data: data
      }
    }


    #calculs de poids moyens pour recap par type pour une entreprise
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

  def show
    @company = Company.find(params[:id])

    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name AS type FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{@company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    @types_collects = @collects.group_by { |collect| collect["type"]}
    @series = @types_collects.map do |type_collects|
      data = type_collects[1].map do |type_collect|
        {
          x: (type_collect["start_at"].to_time.to_i * 1000 + 3600000),
          x2: (type_collect["end_at"].to_time.to_i * 1000 + 3600000),
          y: type_collect["weight_person_day"]
        }
      end
      {
        name: type_collects.first,
        data: data
      }
    end

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
