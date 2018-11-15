class BigFormController < ApplicationController
  include Wicked::Wizard
  layout "connected"

  steps :company_infos, :trash_gestion, :company_willing, :employees_willing, :referent_willing, :charte

  def show
    @user = User.last
    @form = @user.company.form

    @company_know_hows = CompanyKnowHow.all
    @form_company_know_how = FormCompanyKnowHow.new

    @trash_providers = TrashProvider.all
    @form_trash_provider = FormTrashProvider.new

    @trash_working_types = TrashWorkingType.all
    @form_trash_working_type = FormTrashWorkingType.new

    @dispositives = Dispositive.all
    @form_dispositive = FormDispositive.new

    render_wizard
  end

  def update
    @user = current_user
    @form = @user.company.form
    @form.update_attributes(form_params)

    case step

    when :company_infos
      form_ckh_params["company_know_how_id"].each do |id|
        unless id.blank?
          @form_company_know_how = FormCompanyKnowHow.new(company_know_how_id: id.to_i, form: @form)
          @form_company_know_how.save
        end
      end

    when :trash_gestion
      form_tp_params["trash_provider_id"].each do |id|
        unless id.blank?
          @form_trash_provider = FormTrashProvider.new(trash_provider_id: id.to_i, form: @form)
          @form_trash_provider.save
        end
      end

      form_twt_params["trash_working_type_id"].each do |id|
        unless id.blank?
          @form_trash_working_type = FormTrashWorkingType.new(trash_working_type_id: id.to_i, form: @form)
          @form_trash_working_type.save
        end
      end

    when :company_willing
      form_d_params["dispositive_id"].each do |id|
        unless id.blank?
          @form_dispositive = FormDispositive.new(dispositive_id: id.to_i, form: @form)
          @form_dispositive.save
        end
      end
    end

    render_wizard @form
  end

  # def finish_wizard_path
  #   # path à déterminer, probablement vers l'admin referent
  # end

  private

  def form_params
    params.require(:form).permit(:cgv, :charte, :company_activity, :company_employees_nb, :company_participant_nb, :trash_indicator, :trash_indicator_list, :trash_types, :trash_sorting, :trash_sorting_types, :trash_sorting_quality, :trash_sorting_knowledge, :structure_sensitivity, :structure_environment_strategy, :structure_environment_strategy_examples, :structure_ecologic_approach, :structure_ecologic_approach_dispositives, :structure_concrete_actions, :structure_direction_interest, :structure_direction_interest_reasons, :structure_expectations, :employees_knowledge, :employees_knowledge_interest, :employees_propositions, :employees_propositions_examples, :employees_propositions_handled, :employees_concerned, :employees_engagement, :employees_actions_work, :employees_actions_home, :referent_implication, :referent_sorts, :referent_accompany, :referent_complications, :referent_winner, :referent_willing, :referent_obligation, :referent_obligation_feeling, :referent_valorisation, :referent_fun, :referent_techniques, :referent_techniques_examples, :referent_actions_home, :referent_actions_home_examples, :referent_personal_reasons, :referent_changes_wanted, :referent_accompaniment_need, :referent_sex, :referent_age, :referent_seniority, :referent_service)
  end

  def form_ckh_params
    params.require(:form)[:form_company_know_how]
  end

  def form_tp_params
    params.require(:form)[:form_trash_provider]
  end

  def form_twt_params
    params.require(:form)[:form_trash_working_type]
  end

  def form_d_params
    params.require(:form)[:form_dispositive]
  end

end
