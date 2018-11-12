class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :trash_working_types, :type, :trash
  end
end
