class AddColumnToUserBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_results, :favorable_reduction, :string
    add_column :user_behaviour_results, :crappy_reduction, :string
  end
end
