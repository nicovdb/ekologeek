class CreatePriorityActions < ActiveRecord::Migration[5.2]
  def change
    create_table :priority_actions do |t|
      t.references :user_behaviour_diag, foreign_key: true
      t.integer :priority_level
      t.string :action

      t.timestamps
    end
  end
end
