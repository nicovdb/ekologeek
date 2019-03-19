class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :cover
      t.string :subtitle
      t.text :content
      t.boolean :published
      t.integer :visibility
      t.string :author

      t.timestamps
    end
  end
end
