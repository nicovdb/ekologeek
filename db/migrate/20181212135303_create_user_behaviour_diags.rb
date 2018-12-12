class CreateUserBehaviourDiags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_behaviour_diags do |t|
      t.references :user, foreign_key: true
      t.string :work_sorting_order
      t.string :work_sorting_applied
      t.string :work_trash_reduction
      t.text :work_trash_reduction_comment
      t.string :home_sorting_order
      t.string :home_sorting_applied
      t.string :home_trash_reduction
      t.text :home_trash_reduction_comment
      t.string :context_knowledge
      t.text :context_knowledge_comment
      t.string :concerned
      t.string :trash_reduction_hard
      t.string :dedicated_employee
      t.boolean :want_to_help, default: false
      t.text :no_app_reason_comment
      t.text :app_reason_comment

      t.timestamps
    end
  end
end
