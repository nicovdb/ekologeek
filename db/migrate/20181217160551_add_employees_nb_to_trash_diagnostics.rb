class AddEmployeesNbToTrashDiagnostics < ActiveRecord::Migration[5.2]
  def change
    add_column :trash_diagnostics, :employees_nb, :integer
  end
end
