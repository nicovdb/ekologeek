class CreateResultNotMadeReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :result_not_made_reasons do |t|
      t.references :user_behaviour_result, foreign_key: true
      t.references :not_made_reason, foreign_key: true

      t.timestamps
    end
  end
end
