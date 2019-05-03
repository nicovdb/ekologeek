class ChangeTypeToPublishDate < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :publish_date, :date
  end
end
