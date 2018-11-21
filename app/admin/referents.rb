ActiveAdmin.register Referent do
  config.filters = false
  actions :index, :show

  permit_params :company_id, :user_id

  index download_links: false do
    selectable_column
    id_column
      column :company
      column :user
    actions
  end

  show do
    panel "Référent" do
      table_for referent.user do
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

    panel "Entreprise" do
      table_for referent.user.company do
        column :name
        column :town
      end
    end
  end
end
