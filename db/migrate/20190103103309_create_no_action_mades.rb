class CreateNoActionMades < ActiveRecord::Migration[5.2]
  def change
    create_table :no_action_mades do |t|
      t.string :action
      t.references :user_behaviour_result, foreign_key: true

      t.timestamps
    end
  end
end
