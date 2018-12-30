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
    @series = @types_collects.map.with_index { |type_collects, index|
      @colors = ["#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f", "#f45b5b", "#91e8e1"]
      @data = type_collects[1].map { |type_collect| {x: (type_collect["start_at"].to_time.to_i * 1000), x2: (type_collect["end_at"].to_time.to_i * 1000), y: type_collect["weight_person_day"], color: @colors[index] }}
      {
        name: type_collects.first,
        data: @data
      }
    }
  end
end
