class CreateDiagActions < ActiveRecord::Migration[5.2]
  def change
    create_table :diag_actions do |t|
      t.string :action
      t.references :company_behaviour, foreign_key: true

      t.timestamps
    end
  end
end
