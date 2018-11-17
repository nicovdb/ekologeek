class FormulairesController < ApplicationController
  include Wicked::Wizard
  # before_action :load_form_wizard, except: %i(validate_step)

  layout "connected"

  steps :company_infos, :trash_gestion, :company_willing, :employees_willing, :referent_willing, :charte

  def show
    @user = current_user
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

    @company_know_hows = CompanyKnowHow.all
    @trash_providers = TrashProvider.all
    @trash_working_types = TrashWorkingType.all
    @dispositives = Dispositive.all

    case step
    when :company_infos
      @form.company_infos = true
    when :trash_gestion
      @form.trash_gestion = true
    when :company_willing
      @form.company_willing = true
    when :employees_willing
      @form.employees_willing = true
    when :referent_willing
      @form.referent_willing_validation = true
    when :charte
      @form.charte_validation = true
    end

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


