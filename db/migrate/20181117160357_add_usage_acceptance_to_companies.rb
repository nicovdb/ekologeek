class AddUsageAcceptanceToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :usage_acceptance, :boolean, default: false
  end
end
