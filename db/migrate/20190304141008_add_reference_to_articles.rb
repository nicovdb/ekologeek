class AddReferenceToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :project, index: true
  end
end
