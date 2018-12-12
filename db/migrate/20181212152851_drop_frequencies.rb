class DropFrequencies < ActiveRecord::Migration[5.2]
  def change
    drop_table :frequencies
  end
end
