class AddConfidentialityToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :confidentiality, :boolean, default: false
  end
end
