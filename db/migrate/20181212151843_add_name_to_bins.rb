class AddNameToBins < ActiveRecord::Migration[5.2]
  def change
    add_column :bins, :name, :string
  end
end
