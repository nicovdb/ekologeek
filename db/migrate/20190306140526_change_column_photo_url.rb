class ChangeColumnPhotoUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :image_data
    change_column :photos, :image_data, :text
  end
end
