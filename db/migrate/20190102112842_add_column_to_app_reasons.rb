class AddColumnToAppReasons < ActiveRecord::Migration[5.2]
  def change
    add_column :app_reasons, :public, :boolean, default: false
  end
end
