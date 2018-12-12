class CreateBins < ActiveRecord::Migration[5.2]
  def change
    create_table :bins do |t|
      t.references :company, foreign_key: true
      t.integer :volume
      t.string :collector
      t.boolean :shared
      t.integer :cost

      t.timestamps
    end
  end
end
