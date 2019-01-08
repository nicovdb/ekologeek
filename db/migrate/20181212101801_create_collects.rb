class CreateCollects < ActiveRecord::Migration[5.2]
  def change
    create_table :collects do |t|
      t.references :bin, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :filled_rate
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
