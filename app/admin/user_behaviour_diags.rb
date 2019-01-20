ActiveAdmin.register UserBehaviourDiag do
  config.filters = true
  actions :index, :show

  filter :page_five, as: :check_boxes

  index do
    selectable_column
    id_column
    column :company
    column :user
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
    column :favorable_reduction
    column :crappy_reduction
    column :trash_reduction_hard
    column :dedicated_employee
    column (:priority_actions){ |form| form.priority_actions.map { |action| "#{action.action} (#{action.priority_level})" }}
    column (:app_reasons){ |form| form.app_reasons.map { |reason| reason.reason }}
    column (:no_app_reasons){ |form| form.no_app_reasons.map { |reason| reason.reason }}
    column :want_to_help
    column :sexe
    column :age
    column :seniority
    column :page_five
    actions
  end

  show do
    attributes_table do
      row :company
      row :user
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
      row :favorable_reduction
      row :crappy_reduction
      row :trash_reduction_hard
      row :dedicated_employee
      row (:priority_actions){ |form| form.priority_actions.map { |action| "#{action.action} (#{action.priority_level})" }}
      row :want_to_help
      row (:app_reasons){ |form| form.app_reasons.map { |reason| reason.reason }}
      row (:no_app_reasons){ |form| form.no_app_reasons.map { |reason| reason.reason }}
      row :sexe
      row :age
      row :seniority
      row :page_five
    end
  end

  csv do
    column (:company) {|form| form.company.name}
    column (:user) {|form| form.user.name}
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
    column :favorable_reduction
    column :crappy_reduction
    column :trash_reduction_hard
    column :dedicated_employee
    column (:priority_actions){ |form| form.priority_actions.map { |action| "#{action.action} (#{action.priority_level})" }}
    column (:app_reasons){ |form| form.app_reasons.map { |reason| reason.reason }}
    column (:no_app_reasons){ |form| form.no_app_reasons.map { |reason| reason.reason }}
    column :want_to_help
    column :sexe
    column :age
    column :seniority
    column :page_five
  end

end
