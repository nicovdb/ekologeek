class CreateNoAppReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :no_app_reasons do |t|
      t.string :reason

      t.timestamps
    end
  end
end
