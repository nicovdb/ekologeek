class CreateCompanyBehaviours < ActiveRecord::Migration[5.2]
  def change
    create_table :company_behaviours do |t|
      t.references :company, foreign_key: true
      t.integer :participants_nb
      t.string :employees_sensitized
      t.text :employees_sensitized_comment
      t.string :actions_displayed
      t.string :strategic_display
      t.text :strategic_display_comment
      t.string :newbies_sensitized
      t.text :newbies_sensitized_comment
      t.string :indicators_communicated
      t.text :indicators_communicated_comment
      t.string :daily_actions_diag
      t.string :status
      t.string :actions_nb_result

      t.timestamps
    end
  end
end
