class AddCheckToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :charte, :boolean, default: false
    add_column :forms, :cgv, :boolean, default: false
  end
end
