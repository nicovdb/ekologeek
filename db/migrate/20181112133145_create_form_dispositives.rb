class CreateFormDispositives < ActiveRecord::Migration[5.2]
  def change
    create_table :form_dispositives do |t|
      t.references :form, foreign_key: true
      t.references :dispositive, foreign_key: true

      t.timestamps
    end
  end
end
