class AddBinTypeRefToBins < ActiveRecord::Migration[5.2]
  def change
    add_reference :bins, :bin_type, foreign_key: true
  end
end
