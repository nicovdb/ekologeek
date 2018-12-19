class ChartsController < ApplicationController

  layout "charts"

  def index
    @collects = Collect.all
    @bins = current_user.bins
    @bin_types = BinType.all
    @companies = Company.all
  end

  def kilo_per_employee_per_day
    sql = "SELECT start_at, end_at, weight_person_day, bin_types.name FROM collects
                JOIN bins ON bins.id = collects.bin_id
                JOIN companies ON companies.id = bins.company_id
                JOIN bin_types ON bin_types.id = bins.bin_type_id
                WHERE companies.id = #{current_user.company.id}"
    @collects = ActiveRecord::Base.connection.execute(sql)
    values = @collects.values
    @types = values.map { |value| value[3]}.uniq
    render json: @types.map { |type|
      {
        name: type,
        data: @collects.select { |k, v| k["name"]  == type}.group_by_day { |d| d["start_at"] }.sum {|k, v| v[0]["weight_person_day"] }
      }
    }
  end
end
