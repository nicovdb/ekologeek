class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :company, foreign_key: true
      t.string :company_activity
      t.string :company_employees_nb
      t.string :company_participant_nb
      t.string :trash_indicator
      t.text :trash_indicator_list
      t.string :trash_types
      t.string :trash_sorting
      t.text :trash_sorting_types
      t.string :trash_sorting_quality
      t.string :trash_sorting_knowledge
      t.string :structure_sensitivity
      t.string :structure_environment_strategy
      t.text :structure_environment_strategy_examples
      t.string :structure_ecologic_approach
      t.text :structure_concrete_actions
      t.string :structure_direction_interest
      t.text :structure_direction_interest_reasons
      t.text :structure_expectations
      t.string :employees_knowledge
      t.string :employees_knowledge_interest
      t.string :employees_propositions
      t.text :employees_propositions_examples
      t.text :employees_propositions_handled
      t.string :employees_concerned
      t.string :employees_engagement
      t.string :employees_actions_work
      t.string :employees_actions_home
      t.string :referent_implication
      t.string :referent_sorts
      t.string :referent_accompany
      t.string :referent_complications
      t.string :referent_winner
      t.string :referent_willing
      t.string :referent_obligation
      t.string :referent_obligation_feeling
      t.string :referent_valorisation
      t.string :referent_fun
      t.string :referent_techniques
      t.text :referent_techniques_examples
      t.string :referent_actions_home
      t.text :referent_actions_home_examples
      t.text :referent_personal_reasons
      t.text :referent_changes_wanted
      t.text :referent_accompaniment_need
      t.string :referent_sex
      t.string :referent_age
      t.string :referent_seniority
      t.string :referent_service

      t.timestamps
    end
  end
end
