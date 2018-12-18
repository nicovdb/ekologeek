class CreateBinTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bin_types do |t|
      t.string :name
      t.float :density

      t.timestamps
    end
  end
end
