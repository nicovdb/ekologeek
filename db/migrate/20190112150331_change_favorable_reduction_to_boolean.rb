class ChangeFavorableReductionToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :user_behaviour_diags, :favorable_reduction, 'boolean USING CAST(favorable_reduction AS boolean)'
  end
end
