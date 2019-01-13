class ChangeFavorableReductionToString < ActiveRecord::Migration[5.2]
  def change
      change_column :user_behaviour_diags, :favorable_reduction, :string
  end
end
