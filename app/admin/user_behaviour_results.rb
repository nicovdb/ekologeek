ActiveAdmin.register UserBehaviourResult do
  config.filters = true
  actions :index, :show

  filter :page_six, as: :check_boxes

  index do
    selectable_column
    id_column
    column (:company){ |form| form.user.company }
    column :user
    column :starting_month
    column (:action_mades){ |form| form.action_mades.map { |action| action.action }}
    column :actions_made_reasons
    column (:no_action_mades){ |form| form.no_action_mades.map { |action| action.action }}
    column (:not_made_reasons){ |form| form.not_made_reasons.map { |reason| reason.reason }}
    column :actions_not_made_comment
    column :work_sorting_order
    column :work_sorting_applied
    column :work_trash_reduction
    column :work_trash_reduction_comment
    column :home_sorting_order
    column :home_sorting_applied
    column :home_trash_reduction
    column :home_trash_reduction_comment
    column :context_knowledge
    column :context_knowledge_comment
    column :concerned
    column :concerned_comment
    column :favorable_reduction
    column :crappy_reduction
    column :trash_reduction_hard
    column :trash_reduction_hard_comment
    column :dedicated_employee
    column :dedicated_employee_comment
    column :work_continue
    column :work_continue_comment
    column :home_continue
    column :home_continue_comment
    column :accompanier_sort_ready
    column :accompanier_sort_ready_comment
    column :accompanier_sort_want
    column :accompanier_sort_want_comment
    column :accompanier_reduction_ready
    column :accompanier_reduc_ready_comment
    column :accompanier_reduction_want
    column :accompanier_reduc_want_comment
    column :sex
    column :age
    column :seniority
    column :page_six
    actions
  end

  show do
    attributes_table do
      row (:company){ |form| form.user.company }
      row :user
      row :starting_month
      row (:action_mades){ |form| form.action_mades.map { |action| action.action }}
      row :actions_made_reasons
      row (:no_action_mades){ |form| form.no_action_mades.map { |action| action.action }}
      row (:not_made_reasons){ |form| form.not_made_reasons.map { |reason| reason.reason }}
      row :actions_not_made_comment
      row :work_sorting_order
      row :work_sorting_applied
      row :work_trash_reduction
      row :work_trash_reduction_comment
      row :home_sorting_order
      row :home_sorting_applied
      row :home_trash_reduction
      row :home_trash_reduction_comment
      row :context_knowledge
      row :context_knowledge_comment
      row :concerned
      row :concerned_comment
      row :favorable_reduction
      row :crappy_reduction
      row :trash_reduction_hard
      row :trash_reduction_hard_comment
      row :dedicated_employee
      row :dedicated_employee_comment
      row :work_continue
      row :work_continue_comment
      row :home_continue
      row :home_continue_comment
      row :accompanier_sort_ready
      row :accompanier_sort_ready_comment
      row :accompanier_sort_want
      row :accompanier_sort_want_comment
      row :accompanier_reduction_ready
      row :accompanier_reduc_ready_comment
      row :accompanier_reduction_want
      row :accompanier_reduc_want_comment
      row :sex
      row :age
      row :seniority
      row :page_six
    end
  end

  csv do
    column (:company){ |form| form.user.company.name }
    column (:user) { |form| form.user.name }
    column :starting_month
    column (:action_mades){ |form| form.action_mades.map { |action| action.action }}
    column :actions_made_reasons
    column (:no_action_mades){ |form| form.no_action_mades.map { |action| action.action }}
    column (:not_made_reasons){ |form| form.not_made_reasons.map { |reason| reason.reason }}
    column :actions_not_made_comment
    column :work_sorting_order
    column :work_sorting_applied
    column :work_trash_reduction
    column :work_trash_reduction_comment
    column :home_sorting_order
    column :home_sorting_applied
    column :home_trash_reduction
    column :home_trash_reduction_comment
    column :context_knowledge
    column :context_knowledge_comment
    column :concerned
    column :concerned_comment
    column :favorable_reduction
    column :crappy_reduction
    column :trash_reduction_hard
    column :trash_reduction_hard_comment
    column :dedicated_employee
    column :dedicated_employee_comment
    column :work_continue
    column :work_continue_comment
    column :home_continue
    column :home_continue_comment
    column :accompanier_sort_ready
    column :accompanier_sort_ready_comment
    column :accompanier_sort_want
    column :accompanier_sort_want_comment
    column :accompanier_reduction_ready
    column :accompanier_reduc_ready_comment
    column :accompanier_reduction_want
    column :accompanier_reduc_want_comment
    column :sex
    column :age
    column :seniority
    column :page_six
  end

end
