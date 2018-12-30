class ChartsController < ApplicationController

  layout "charts"

  def index
    #données des séries pour le graphique récapitulatif de chaque structure
    ##il faut reprendre ce code en changeant légérement la requete sql pour permettre à l'admin
    ##de choisir l'entreprise qu'il veut voir parmi une liste déroulante
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    @types_collects = @collects.group_by { |collect| collect["name"]}
    @series = @types_collects.map.with_index { |type_collects, index|
      colors = ["#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f",
        "#f45b5b", "#91e8e1", "#DB7F8E", "604D53", "#9DA3A4", "#FFC857", "#C5283D", "#255F85", "#481D24",
        "#44CFCB", "#4EA5D9", "#224870", "#122C34", "#F96900", "#7A4419", "#755C1B" ]
      data = type_collects[1].map { |type_collect|
        {
          x: (type_collect["start_at"].to_time.to_i * 1000 + 3600000),
          x2: (type_collect["end_at"].to_time.to_i * 1000 + 3600000),
          y: type_collect["weight_person_day"],
          color: colors[index]
        }
      }
      {
        name: type_collects.first,
        data: data
      }
    }

    #les données pour le graphique spécial admin avec toutes les structures
    admin_sql = "SELECT start_at, end_at, weight_person_day, companies.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN projects ON projects.id = companies.project_id
                WHERE projects.id = #{current_user.company.project.id}"
    @admin_collects = ActiveRecord::Base.connection.execute(admin_sql)
    @companies_collects = @admin_collects.group_by { |collect| collect["name"]}
    @admin_series = @companies_collects.map.with_index { |company_collects, index|
      colors = ["#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f",
        "#f45b5b", "#91e8e1", "#DB7F8E", "604D53", "#9DA3A4", "#FFC857", "#C5283D", "#255F85", "#481D24",
        "#44CFCB", "#4EA5D9", "#224870", "#122C34", "#F96900", "#7A4419", "#755C1B" ]
      data = company_collects[1].map { |company_collect|
        {
          x: (company_collect["start_at"].to_time.to_i * 1000 + 3600000),
          x2: (company_collect["end_at"].to_time.to_i * 1000 + 3600000),
          y: company_collect["weight_person_day"],
          color: colors[index]
        }
      }
      {
        name: company_collects.first,
        data: data
      }
    }


    #calculs de poids moyens pour recap
    @total_weight = 0
    @days_and_weight_per_type_per_person = @types_collects.map {|type_collects|
      days = 0
      weight = 0
      type_collects[1].map { |type_collect|
        days += (type_collect["end_at"].to_date - type_collect["start_at"].to_date)
        weight += ((type_collect["end_at"].to_date - type_collect["start_at"].to_date) * type_collect["weight_person_day"])
      }
      @total_weight += weight
      [type_collects.first, days, weight]
    }
  end
end
