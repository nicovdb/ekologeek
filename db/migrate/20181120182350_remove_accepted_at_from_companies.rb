class RemoveAcceptedAtFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :accepted_at
  end
end
