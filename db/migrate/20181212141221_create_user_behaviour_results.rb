class CreateUserBehaviourResults < ActiveRecord::Migration[5.2]
  def change
    create_table :user_behaviour_results do |t|
      t.references :user, foreign_key: true
      t.string :starting_month
      t.string :actions_made
      t.text :actions_made_reasons
      t.string :actions_not_made
      t.string :work_sorting_order
      t.string :work_sorting_applied
      t.string :work_trash_reduction
      t.text :work_trash_reduction_comment
      t.string :new_actions
      t.text :new_actions_comment
      t.string :more_actions
      t.text :more_actions_comment
      t.string :better_actions
      t.text :better_actions_comment
      t.string :context_knowledge
      t.text :context_knowledge_comment
      t.string :concerned
      t.text :concerned_comment
      t.string :trash_reduction_hard
      t.text :trash_reduction_hard_comment
      t.string :dedicated_employee
      t.text :dedicated_employee_comment
      t.string :work_continue
      t.text :work_continue_comment
      t.string :home_continue
      t.text :home_continue_comment
      t.string :accompanier
      t.text :accompanier_comment

      t.timestamps
    end
  end
end
