ActiveAdmin.register Company do
  config.filters = true
  actions :index, :show, :edit, :update

  permit_params :name, :town, :project_id, :accepted, :created_at

  index do
    selectable_column
    id_column
      column :name
      column :town
      column (:participants){ |company| company.trash_diagnostic.employees_nb}
      column :form
      column :accepted
      column :created_at
    actions
  end

  filter :name, as: :select
  filter :accepted, as: :select
  filter :created_at, as: :date_range

  csv do
    column :name
    column :town
    column (:participants){ |company| company.trash_diagnostic.employees_nb}
    column :accepted
    column :created_at
  end

  show do
    attributes_table do
      row :name
      row :town
      row (:participants){ |company| company.trash_diagnostic.employees_nb}
      row :form
      row :accepted
    end

    panel "Référent" do
      table_for company.referent.user do
        column :civility
        column :first_name
        column :last_name
        column :role
        column :email
        column :telephone
        column :newsletter_ekg
        column :newsletter_dzd
        column :admin
      end
    end

    panel "Employees" do
      table_for company.users do
        column :civility
        column :first_name
        column :last_name
        column :role
        column :email
        column :telephone
        column :newsletter_ekg
        column :newsletter_dzd
        column :admin
      end
    end
  end
end
