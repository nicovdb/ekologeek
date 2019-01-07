class AddBooleansToCompanyBehaviour < ActiveRecord::Migration[5.2]
  def change
    add_column :company_behaviours, :step_one, :boolean, default: false
    add_column :company_behaviours, :step_two, :boolean, default: false
    add_column :company_behaviours, :step_three, :boolean, default: false
  end
end
