class DropActionsMadeToUserBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_behaviour_results, :actions_made
  end
end
