class CreateTrashFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_frequencies do |t|
      t.references :frequency, foreign_key: true
      t.references :bin, foreign_key: true

      t.timestamps
    end
  end
end
