class AddBooleanToUserBehaviourDiag < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_diags, :page_one, :boolean, default: false
    add_column :user_behaviour_diags, :page_two, :boolean, default: false
    add_column :user_behaviour_diags, :page_three, :boolean, default: false
    add_column :user_behaviour_diags, :page_four, :boolean, default: false
    add_column :user_behaviour_diags, :page_five, :boolean, default: false
  end
end
