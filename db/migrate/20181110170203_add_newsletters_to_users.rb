class AddNewslettersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :newsletter_ekg, :boolean, default: false
    add_column :users, :newsletter_dzd, :boolean, default: false
  end
end
