class ChangeNullToTrueDiagAppReasons < ActiveRecord::Migration[5.2]
  def change
    change_column_null :diag_app_reasons, :updated_at, true
    change_column_null :diag_app_reasons, :created_at, true
  end
end
