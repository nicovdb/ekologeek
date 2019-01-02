class AddBooleanPagesToUserBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_results, :page_one, :boolean, default: false
    add_column :user_behaviour_results, :page_two, :boolean, default: false
    add_column :user_behaviour_results, :page_three, :boolean, default: false
    add_column :user_behaviour_results, :page_four, :boolean, default: false
    add_column :user_behaviour_results, :page_five, :boolean, default: false
    add_column :user_behaviour_results, :page_six, :boolean, default: false
  end
end
