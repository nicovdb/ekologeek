ActiveAdmin.register AdminUser do
  permit_params :email,
                :first_name,
                :last_name,
                :company_id,
                :role,
                :civility,
                :telephone,
                :newsletter_ekg,
                :newsletter_dzd,
                :deleted,
                :password,
                :password_confirmation

  index do
    selectable_column
    id_column
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
    column :current_sign_in_at
    column :sign_in_count
    # column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :company_id
  filter :role
  filter :civility
  filter :telephone
  filter :newsletter_ekg
  filter :newsletter_dzd
  filter :deleted
  filter :admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :company_id
      f.input :role
      f.input :civility
      f.input :telephone
      f.input :newsletter_ekg
      f.input :newsletter_dzd
      f.input :deleted
      f.input :admin
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
