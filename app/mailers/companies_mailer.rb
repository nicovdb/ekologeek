class CompaniesMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  def creation_confirmation(referent, user)
    @user = user
    @referent = referent
    mail(to: @referent.user.email, subject:  "Votre compte a été créé !")
  end

end
