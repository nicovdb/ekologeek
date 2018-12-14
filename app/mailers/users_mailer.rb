class UsersMailer < ApplicationMailer
  helper :application
  # include Devise::Controllers::UrlHelpers

  def welcome(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject:  "Votre compte a été créé !")
  end

end
