class CreateFormTrashProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :form_trash_providers do |t|
      t.references :form, foreign_key: true
      t.references :trash_provider, foreign_key: true

      t.timestamps
    end
  end
end
