class AddSexeAndAgeToUserBehaviourDiag < ActiveRecord::Migration[5.2]
  def change
    add_column :user_behaviour_diags, :sexe, :string
    add_column :user_behaviour_diags, :age, :integer
    add_column :user_behaviour_diags, :seniority, :integer

  end
end
