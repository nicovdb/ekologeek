class AddEmployeesWillingToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :employees_willing, :boolean, default: false
  end
end
