class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :unknown]
  before_action :authenticate_user!, only: [:show, :edit, :update]

  layout "connected"

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def unknown
    flash.now[:alert] = 'Alert message!'
    attributes = {
      first_name: "unknown",
      last_name: "unknown",
      role: "unknown",
      telephone: "unknown",
      email: (0...50).map { ('a'..'z').to_a[rand(26)] }.join,
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
