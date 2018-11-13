class UsersController < ApplicationController

  layout "connected"

  def show
    @user = User.find(params[:id])
  end
end
