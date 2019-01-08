class DropTablesObjectives < ActiveRecord::Migration[5.2]
  def change
    drop_table :objectives
  end
end
