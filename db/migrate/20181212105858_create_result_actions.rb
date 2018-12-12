class CreateResultActions < ActiveRecord::Migration[5.2]
  def change
    create_table :result_actions do |t|
      t.references :company_behaviour, foreign_key: true
      t.string :name
      t.text :comment
      t.string :state
      t.text :state_comment
      t.string :domain
      t.text :domain_comment
      t.integer :employees_making_nb

      t.timestamps
    end
  end
end
