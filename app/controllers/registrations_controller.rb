class RegistrationsController < Devise::RegistrationsController


  protected

  def update_resource(resource, params)
    return super if params["password"]&.present?
    resource.update_without_password(params.except("current_password"))
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  private


  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :role,
      :civility,
      :address,
      :telephone,
      :email,
      :newsletter_ekg,
      :newsletter_dzd,
      :password,
      :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :role,
      :civility,
      :address,
      :telephone,
      :email,
      :newsletter_ekg,
      :newsletter_dzd,
      :password,
      :password_confirmation,
      :current_password
    )
  end

end
