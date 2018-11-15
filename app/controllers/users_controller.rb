class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :unknown]

  layout "connected"

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unknown
    attributes = {
      first_name: "unknown",
      last_name: "unknown",
      role: "unknown",
      telephone: "unknown",
      email: "unknown",
      newsletter_ekg: false,
      newsletter_dzd: false,
      deleted: true,
      password: @user.encrypted_password
    }
    @user.assign_attributes(attributes)
    @user.save(validate: false)
    redirect_to root_path

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :civility,
      :first_name,
      :last_name,
      :role,
      :telephone,
      :email,
      :newsletter_ekg,
      :newsletter_dzd,
      :password,
      :deleted
    )
  end

end
