class AddAgainToUserBehaviourResults < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_results, :accompanier_sort_ready_comment, :string
    add_column :user_behaviour_results, :accompanier_sort_want_comment, :string
    add_column :user_behaviour_results, :accompanier_reduc_ready_comment, :string
    add_column :user_behaviour_results, :accompanier_reduc_want_comment, :string
  end
end
