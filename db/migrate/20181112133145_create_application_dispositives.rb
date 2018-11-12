class CreateApplicationDispositives < ActiveRecord::Migration[5.2]
  def change
    create_table :application_dispositives do |t|
      t.references :application, foreign_key: true
      t.references :dispositive, foreign_key: true

      t.timestamps
    end
  end
end
