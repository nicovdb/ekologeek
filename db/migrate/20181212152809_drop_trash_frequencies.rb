class DropTrashFrequencies < ActiveRecord::Migration[5.2]
  def change
    drop_table :trash_frequencies
  end
end
