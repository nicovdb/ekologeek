class CompanyBehaviourResultsController < ApplicationController

  include Wicked::Wizard

  layout "connected"

  steps :step_one, :step_two, :step_three, :actions, :end

  def new
    @company = current_user.company
    @company_behaviour = CompanyBehaviour.new(company_id: @company.id)
    if @company_behaviour.save
      redirect_to company_behaviour_result_path(:step_one)
    end
  end


  def show
    @company = current_user.company
    @company_behaviour = @company.company_behaviours.last
    @result_action = ResultAction.new(company_behaviour_id: @company_behaviour )
    @result_actions = @company_behaviour.result_action_ids
    @counter = 1

    render_wizard
  end

  def update

    @company = current_user.company
    @company_behaviour = @company.company_behaviours.last
    @result_actions = @company_behaviour.result_action_ids

    case step
    when :step_one
      @company_behaviour.step_one = true
      @company_behaviour.result = true
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
      :participants_nb
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
    params.require(:company_behaviour).permit!
  end


end
