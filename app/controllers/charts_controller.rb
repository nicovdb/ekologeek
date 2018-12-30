class ChartsController < ApplicationController

  layout "charts"

  def index
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    @types_collects = @collects.group_by { |collect| collect["name"]}
    @series = @types_collects.map { |type_collects|
      @data = type_collects[1].map { |type_collect| {x: (type_collect["start_at"].to_time.to_i * 1000), x2: (type_collect["end_at"].to_time.to_i * 1000), y: type_collect["weight_person_day"]}}
      {
        name: type_collects.first,
        data: @data
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
    @types_collects = @collects.group_by { |collect| collect["name"]}
    render json: @series = @types_collects.map { |type_collects|
      @data = []
      @start_at = type_collects[1].map { |type_collect| [type_collect["start_at"], type_collect["weight_person_day"]]}
      @end_at = type_collects[1].map { |type_collect| [type_collect["end_at"], type_collect["weight_person_day"]]}
      @data << @start_at
      @data << @end_at
      {
        name: type_collects.first,
        data: @data.flatten(1)
      }
    }
  end
end
