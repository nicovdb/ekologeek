class AddBullshitToUserBehaviourResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_behaviour_results, :accompanier, :accompanier_sort_ready
    add_column :user_behaviour_results, :accompanier_sort_want, :string
    add_column :user_behaviour_results, :accompanier_reduction_ready, :string
    add_column :user_behaviour_results, :accompanier_reduction_want, :string
  end
end
