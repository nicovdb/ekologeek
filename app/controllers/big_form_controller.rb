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

  def finish_wizard_path
    # path à déterminer, probablement vers l'admin referent
  end

  private

  def form_params
    params.require(:form).permit(:company_activity, :company_employees_nb, :company_participant_nb, :trash_indicator, :trash_indicator_list, :trash_types, :trash_sorting, :trash_sorting_types, :trash_sorting_quality, :trash_sorting_knowledge, :structure_sensitivity, :structure_environment_strategy, :structure_environment_strategy_examples, :structure_ecologic_approach, :structure_ecologic_approach_dispositives, :structure_concrete_actions, :structure_direction_interest, :structure_direction_interest_reasons, :structure_expectations, :employees_knowledge, :employees_knowledge_interest, :employees_propositions, :employees_propositions_examples, :employees_propositions_handled, :employees_concerned, :employees_engagement, :employees_actions_work, :employees_actions_home, :referent_implication, :referent_sorts, :referent_accompany, :referent_complications, :referent_winner, :referent_willing, :referent_obligation, :referent_obligation_feeling, :referent_valorisation, :referent_fun, :referent_techniques, :referent_techniques_examples, :referent_actions_home, :referent_actions_home_examples, :referent_personal_reasons, :referent_changes_wanted, :referent_accompaniment_need, :referent_sex, :referent_age, :referent_seniority, :referent_service)
  end
end
