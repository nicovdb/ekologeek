class AddFieldsToUserBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_results, :home_sorting_order, :string
    add_column :user_behaviour_results, :home_sorting_applied, :string
    add_column :user_behaviour_results, :home_trash_reduction, :string
    add_column :user_behaviour_results, :home_trash_reduction_comment, :text
  end
end
