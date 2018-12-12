class CreateFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :frequencies do |t|
      t.integer :number
      t.string :periodicity
      t.string :day

      t.timestamps
    end
  end
end
