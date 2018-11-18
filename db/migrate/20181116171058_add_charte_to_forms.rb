class AddCharteToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :charte_validation, :boolean, default: false
  end
end
