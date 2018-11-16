class AddCompanyInfosToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :company_infos, :boolean, default: false
  end
end
