class CreateTrashDiagnostics < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_diagnostics do |t|
      t.integer :annual_cost
      t.float :reduction_objective
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
