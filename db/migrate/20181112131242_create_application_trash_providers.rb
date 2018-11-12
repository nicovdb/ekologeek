class CreateApplicationTrashProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :application_trash_providers do |t|
      t.references :application, foreign_key: true
      t.references :trash_provider, foreign_key: true

      t.timestamps
    end
  end
end
