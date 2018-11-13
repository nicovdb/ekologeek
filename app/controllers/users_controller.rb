class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  layout "connected"

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
