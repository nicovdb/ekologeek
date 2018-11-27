ActiveAdmin.register Referent do
  config.filters = true
  actions :index, :show

  permit_params :company_id, :user_id, :confirmed_at, :created_at, :updated_at

  index download_links: false do
    selectable_column
    id_column
      column :created_at
      column :updated_at
      column :company
      column :user
      column(:confirmed_at) {|referent| referent.user.confirmed_at}
    actions
  end

  filter :company, as: :select
  filter :user, as: :select
  filter :created_at, as: :date_range

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
