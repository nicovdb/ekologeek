class AddReferentWillingToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :referent_willing_validation, :boolean, default: false
  end
end
