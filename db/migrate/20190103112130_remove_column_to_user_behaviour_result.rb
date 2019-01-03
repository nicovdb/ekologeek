class RemoveColumnToUserBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_behaviour_results, :actions_not_made
    add_column :user_behaviour_results, :actions_not_made_comment, :string
  end
end
