class AddCoverToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :cover, :string
  end
end
