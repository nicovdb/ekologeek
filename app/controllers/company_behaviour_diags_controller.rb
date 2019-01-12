class CompanyBehaviourDiagsController < ApplicationController

  include Wicked::Wizard

  layout "connected"

  steps :step_one, :step_two, :step_three, :step_four

  def new
    @company = current_user.company
    @company_behaviour = CompanyBehaviour.new(company_id: @company.id)
    if @company_behaviour.save
      redirect_to company_behaviour_diag_path(:step_one)
    end
  end


  def show
    @company = current_user.company
    @company_behaviour = @company.company_behaviours.first
    @diag_action = DiagAction.new(company_behaviour_id: @company_behaviour )
    @diag_actions = @company_behaviour.diag_action_ids

    render_wizard
  end

  def update

    @company = current_user.company
    @company_behaviour = @company.company_behaviours.first
    @diag_actions = @company_behaviour.diag_action_ids

    case step
    when :step_one
      @company_behaviour.step_one = true
      form_params = step_one_params
    when :step_two
      @company_behaviour.step_two = true
      form_params = step_two_params
    when :step_three
      @company_behaviour.step_three = true
      form_params = step_three_params
    end

    @company_behaviour.update_attributes(form_params)
    render_wizard @company_behaviour

  end

  private

  def step_one_params
    params.require(:company_behaviour).permit(
      :participants_nb,
      diag_actions_attributes: {}
    )
  end

  def step_two_params
    params.require(:company_behaviour).permit(
      :employees_sensitized,
      :employees_sensitized_comment,
      :actions_displayed,
      :strategic_display,
      :strategic_display_comment,
      :newbies_sensitized,
      :newbies_sensitized_comment,
      :indicators_communicated,
      :indicators_communicated_comment

    )
  end

  def step_three_params
    params.require(:company_behaviour).permit(
      :daily_actions_diag
    )
  end


end
