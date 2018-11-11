class CompaniesMailer < ApplicationMailer


  def creation_confirmation(referent)

    @referent = referent
    mail(to: @referent.user.email, subject:  "Company #{@referent.company.name} created!")
  end

end
