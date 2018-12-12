class CreateTrashBins < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_bins do |t|
      t.references :trash, foreign_key: true
      t.references :bin, foreign_key: true

      t.timestamps
    end
  end
end
