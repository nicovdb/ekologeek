class AddTestFieldToCompanyBehaviour < ActiveRecord::Migration[5.2]
  def change
    add_column :company_behaviours, :diag_action_comment, :text
  end
end
