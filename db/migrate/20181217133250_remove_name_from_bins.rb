class RemoveNameFromBins < ActiveRecord::Migration[5.2]
  def change
    remove_column :bins, :name
  end
end
