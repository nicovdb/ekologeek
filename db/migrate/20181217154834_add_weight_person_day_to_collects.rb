class AddWeightPersonDayToCollects < ActiveRecord::Migration[5.2]
  def change
    add_column :collects, :weight_person_day, :float
  end
end
