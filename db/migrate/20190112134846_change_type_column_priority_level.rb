class ChangeTypeColumnPriorityLevel < ActiveRecord::Migration[5.2]
  def change
    change_column :priority_actions, :priority_level, :string
  end
end
