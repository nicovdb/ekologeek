class AddAcceptedToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :accepted, :boolean, null: false, default: false
  end
end
