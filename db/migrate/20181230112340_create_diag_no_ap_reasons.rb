class CreateDiagNoApReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :diag_no_ap_reasons do |t|
      t.references :no_app_reason, foreign_key: true
      t.references :user_behaviour_diag, foreign_key: true

      t.timestamps
    end
  end
end
