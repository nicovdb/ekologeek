ActiveAdmin.register CompanyBehaviour, :as => 'Diagnostic Structure' do
  config.filters = true
  scope :diag, default: true
  actions :index, :show

  filter :step_three, as: :check_boxes

  index do
    selectable_column
    id_column
    column :company
    column :participants_nb
    column (:diag_actions){ |form| form.diag_actions.map { |action| "#{action.action} : #{action.diag_action_comment}" }}
    column :employees_sensitized
    column :employees_sensitized_comment
    column :actions_displayed
    column :strategic_display
    column :strategic_display_comment
    column :newbies_sensitized
    column :newbies_sensitized_comment
    column :indicators_communicated
    column :indicators_communicated_comment
    column :daily_actions_diag
    column :step_three
    actions
  end

  show do
    attributes_table do
      row :company
      row :participants_nb
      row (:diag_actions){ |form| form.diag_actions.map { |action| "#{action.action} : #{action.diag_action_comment}" }}
      row :employees_sensitized
      row :employees_sensitized_comment
      row :actions_displayed
      row :strategic_display
      row :strategic_display_comment
      row :newbies_sensitized
      row :newbies_sensitized_comment
      row :indicators_communicated
      row :indicators_communicated_comment
      row :daily_actions_diag
      row :step_three
    end
  end
  #
  csv do
    column (:company) {|form| form.company.name}
    column :participants_nb
    column (:diag_actions){ |form| form.diag_actions.map { |action| "#{action.action} : #{action.diag_action_comment}" }}
    column :employees_sensitized
    column :employees_sensitized_comment
    column :actions_displayed
    column :strategic_display
    column :strategic_display_comment
    column :newbies_sensitized
    column :newbies_sensitized_comment
    column :indicators_communicated
    column :indicators_communicated_comment
    column :daily_actions_diag
    column :step_three
  end

end
