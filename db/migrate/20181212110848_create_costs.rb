class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.integer :global_annual_cost
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
