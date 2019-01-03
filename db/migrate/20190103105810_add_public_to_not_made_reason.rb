class AddPublicToNotMadeReason < ActiveRecord::Migration[5.2]
  def change
    add_column :not_made_reasons, :public, :boolean, default: false
  end
end
