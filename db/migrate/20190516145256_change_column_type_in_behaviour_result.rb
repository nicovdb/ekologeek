class ChangeColumnTypeInBehaviourResult < ActiveRecord::Migration[5.2]
  def change
    change_column :user_behaviour_results, :seniority, :string
  end
end
