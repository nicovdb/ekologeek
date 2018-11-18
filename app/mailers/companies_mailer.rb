class CompaniesMailer < ApplicationMailer


  def creation_confirmation(referent)

    @referent = referent
    mail(to: @referent.user.email, subject:  "Votre compte a été créé !")
  end

end
