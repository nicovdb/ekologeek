class CreateTrashProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_providers do |t|
      t.string :name

      t.timestamps
    end
  end
end
