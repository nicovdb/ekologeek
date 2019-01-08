class AddPublicToNoAppReason < ActiveRecord::Migration[5.2]
  def change
    add_column :no_app_reasons, :public, :boolean, default: false
  end
end
