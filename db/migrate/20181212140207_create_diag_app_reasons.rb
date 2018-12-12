class CreateDiagAppReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :diag_app_reasons do |t|
      t.references :app_reason, foreign_key: true
      t.references :user_behaviour_diag, foreign_key: true

      t.timestamps
    end
  end
end
