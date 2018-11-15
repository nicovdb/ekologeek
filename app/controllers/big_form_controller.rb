class BigFormController < ApplicationController
  include Wicked::Wizard
  layout "connected"

  steps :company_infos, :trash_gestion, :company_willing, :employees_willing, :referent_willing, :charte

  def show
    @user = User.last
    @form = @user.company.form

    @company_know_hows = CompanyKnowHow.all
    @trash_providers = TrashProvider.all
    @trash_working_types = TrashWorkingType.all
    @dispositives = Dispositive.all

    render_wizard
  end

  def update
    @user = current_user
    @form = @user.company.form
    @form.update_attributes(form_params)

    render_wizard @form
  end

  def finish_wizard_path
    candidature_confirmation_path
  end

  private

  def form_params
    params.require(:form).permit!
  end

end
