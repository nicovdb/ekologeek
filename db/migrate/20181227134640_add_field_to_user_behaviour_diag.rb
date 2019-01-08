class AddFieldToUserBehaviourDiag < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_diags, :favorable_reduction, :string
    add_column :user_behaviour_diags, :crappy_reduction, :string
  end
end
