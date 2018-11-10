class CreateReferents < ActiveRecord::Migration[5.2]
  def change
    create_table :referents do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
