class AddResultToCompanyBehaviours < ActiveRecord::Migration[5.2]
  def change
    add_column :company_behaviours, :result, :boolean, default: false
  end
end
