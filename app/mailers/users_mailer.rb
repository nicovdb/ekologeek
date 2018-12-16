class UsersMailer < ApplicationMailer
  helper :application
  # include Devise::Controllers::UrlHelpers

  def welcome(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject:  "Votre compte a été créé !")
  end

end
