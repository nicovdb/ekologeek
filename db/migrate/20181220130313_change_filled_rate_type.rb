class ChangeFilledRateType < ActiveRecord::Migration[5.2]
  def change
    change_column :collects, :filled_rate, :float
  end
end
