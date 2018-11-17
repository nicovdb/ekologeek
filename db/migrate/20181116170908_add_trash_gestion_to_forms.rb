class AddTrashGestionToForms < ActiveRecord::Migration[5.2]
  def change
     add_column :forms, :trash_gestion, :boolean, default: false
  end
end
