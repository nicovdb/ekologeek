class AddColumnToBins < ActiveRecord::Migration[5.2]
  def change
    add_column :bins, :frequency_number, :integer
    add_column :bins, :frequency_periodicity, :string
    add_column :bins, :frequency_day, :string 
  end
end
