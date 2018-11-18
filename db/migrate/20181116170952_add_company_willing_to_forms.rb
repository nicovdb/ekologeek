class AddCompanyWillingToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :company_willing, :boolean, default: false
  end
end
