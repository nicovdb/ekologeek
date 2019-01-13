class ChangeNullToTrueCreatedAt < ActiveRecord::Migration[5.2]
  def change
    change_column_null :diag_no_ap_reasons, :created_at, true
  end
end
