class AddDatesToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :diagnostic_end_at, :date
    add_column :projects, :bilan_start_at, :date
  end
end
