class AddUserInfosToBehaviourResults < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_results, :age, :integer
    add_column :user_behaviour_results, :sex, :string
    add_column :user_behaviour_results, :seniority, :string
  end
end
