class FormulairesMailer < ApplicationMailer


  def candidature_confirmation(user)

    @user = user
    mail(to: @user.email, subject:  "Votre candidature a bien été enregistrée", bcc: 'pauline.r@ekologeek.com')
  end

end
