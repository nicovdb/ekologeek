class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :town
      t.references :project, foreign_key: true
      t.string :accepted_at

      t.timestamps
    end
  end
end
