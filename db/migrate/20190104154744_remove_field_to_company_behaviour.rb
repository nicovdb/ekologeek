class RemoveFieldToCompanyBehaviour < ActiveRecord::Migration[5.2]
  def change
    remove_column :company_behaviours, :diag_action_comment
  end
end
