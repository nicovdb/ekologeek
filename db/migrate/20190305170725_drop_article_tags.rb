class DropArticleTags < ActiveRecord::Migration[5.2]
  def change
    drop_table :article_tags
    drop_table :tags
  end
end
