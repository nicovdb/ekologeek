ActiveAdmin.register CompanyBehaviour, :as => 'Bilan Structure' do
  config.filters = true
  scope :bilan, default: true
  actions :index, :show

  filter :step_three, as: :check_boxes

  index do
    selectable_column
    id_column
    column :company
    column :participants_nb
    column :employees_sensitized
    column :employees_sensitized_comment
    column :actions_displayed
    column :strategic_display
    column :newbies_sensitized
    column :indicators_communicated
    column :actions_nb_result
    column :step_three
    actions
  end

  show do
    attributes_table do
    row :company
    row :participants_nb
    row :employees_sensitized
    row :employees_sensitized_comment
    row :actions_displayed
    row :strategic_display
    row :newbies_sensitized
    row :indicators_communicated
    row :actions_nb_result
    row :step_three
    end

    panel "Actions mises en place" do
      table_for CompanyBehaviour.find(params[:id]).result_actions do
        column :name
        column :comment
        column :state
        column :state_comment
        column :domain
        column :domain_comment
        column :employees_making_nb
      end
    end
  end
  #
  csv do
    column (:company) {|form| form.company.name}
    column :participants_nb
    column :employees_sensitized
    column :employees_sensitized_comment
    column :actions_displayed
    column :strategic_display
    column :newbies_sensitized
    column :indicators_communicated
    column :actions_nb_result
    column :step_three
  end

end
