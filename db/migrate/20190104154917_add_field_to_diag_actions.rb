class AddFieldToDiagActions < ActiveRecord::Migration[5.2]
  def change
    add_column :diag_actions, :diag_action_comment, :text
  end
end
