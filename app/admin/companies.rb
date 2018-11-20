ActiveAdmin.register Company do
  config.filters = false
  actions :index, :show, :edit, :update

  permit_params :name, :town, :project_id, :accepted

   index do
    selectable_column
    id_column
      column :name
      column :town
      column :form
      column :accepted
    actions
  end

  show do
    attributes_table do
      row :name
      row :town
      row :form
      row :accepted
    end

    panel "Référent" do
      table_for company.referent.user do
        column :email
        column :first_name
        column :last_name
        column :company_id
        column :role
        column :civility
        column :telephone
        column :newsletter_ekg
        column :newsletter_dzd
        column :deleted
        column :admin
      end
    end
  end
end
