class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.integer :reduction_percentage
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
