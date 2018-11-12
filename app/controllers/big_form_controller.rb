class BigFormController < ApplicationController
  include Wicked::Wizard

  steps :company_infos, :trash_gestion, :company_willing, :employees_willing, :referent_willing

  def show
    @user = User.last
    @form = @user.company.form

    render_wizard
  end

  def update
    @user = User.last
    @form = @user.company.form
    @form.update_attributes(form_params)

    render_wizard @form
  end

  private

  def form_params
    params.require(:form).permit(:company_activity, :company_employees_nb, :company_participant_nb)
  end
end
