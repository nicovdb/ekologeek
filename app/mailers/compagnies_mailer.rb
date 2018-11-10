class CompagniesMailer < ApplicationMailer


  def creation_confirmation(restaurant)
    @restaurant = restaurant

    mail(
      to:       @referent.user.email,
      subject:  "Compgnies #{@company.name} created!"
    )
  end

end
