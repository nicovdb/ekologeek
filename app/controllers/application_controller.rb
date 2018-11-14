class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || user_path(@user)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
