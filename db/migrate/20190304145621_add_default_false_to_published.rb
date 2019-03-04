class AddDefaultFalseToPublished < ActiveRecord::Migration[5.2]
  def change
    change_column(:articles, :published, :boolean, default: false)
  end
end
