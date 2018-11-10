class CompaniesMailer < ApplicationMailer


  def creation_confirmation(referent)

    @referent = referent
    mail(to: @referent.user.email, subject:  "Compgnies #{@referent.company.name} created!")
  end

end
