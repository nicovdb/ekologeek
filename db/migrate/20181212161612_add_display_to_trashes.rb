class AddDisplayToTrashes < ActiveRecord::Migration[5.2]
  def change
    add_column :trashes, :display, :boolean, default: false
  end
end
