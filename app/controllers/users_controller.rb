class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :unknown, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update]

  layout "connected"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    generated_password = Devise.friendly_token.first(10)
    @user.password = generated_password

    if @user.company_id.nil?
      @user.company = current_user.company
    end

    if @user.save
      @user.send_reset_password_instructions
      redirect_to donnees_path
    else
      render :new
    end
  end

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
      newsletter_ekg: false,
      newsletter_dzd: false,
      deleted: true,
      civility: "unknown",
      password: @user.encrypted_password
    }

    @user.assign_attributes(attributes)
    @user.update_column(:email, (0...50).map { ('a'..'z').to_a[rand(26)] }.join)
    @user.save!(validate: false)

    redirect_to root_path
  end

  def destroy_cookies
    cookies.delete(:_ekologeek_session)
    redirect_to user_path(params["id"])
  end

  def destroy
    @user.destroy
    redirect_to donnees_path
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
      :confirmation_token,
      :confirmation_sent_at,
      :password,
      :deleted,
      :created_by_referent,
      :company_id
    )
  end

end
