class ChartsController < ApplicationController

  layout "charts"

  def index
    # @collects = Collect.all
    # @bins = current_user.bins
    # @bin_types = BinType.all
    # @companies = Company.all

    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    @types_collects = @collects.group_by { |collect| collect["name"]}
    @series = @types_collects.map { |type_collects|
      {
        name: type_collects.first,
        data: type_collects[1].map { |type_collect| [type_collect["start_at"], type_collect["weight_person_day"]]}
      }
    }
  end

  def kilo_per_employee_per_day
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    render json: @types_collects.map { |type_collects|
      {
        name: type_collects.first,
        data: type_collects[1].map { |type_collect| [type_collect["start_at"], type_collect["weight_person_day"]]}
      }
    }
  end
end
