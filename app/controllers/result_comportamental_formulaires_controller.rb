class ResultComportamentalFormulairesController < ApplicationController
  include Wicked::Wizard

  layout "connected"

  steps :start, :action, :no_action, :at_work, :your_behaviour, :after

  def new
    @user = current_user
    @user_behaviour_result = UserBehaviourResult.new(user_id: @user.id)
    if @user_behaviour_result.save
      redirect_to result_comportamental_formulaire_path(:start)
    end
  end

  def show
    @user = current_user
    @user_behaviour_result = @user.user_behaviour_result
    @action_made = ActionMade.new(user_behaviour_result_id: @user_behaviour_result.id )
    @action_mades = @user_behaviour_result.action_made_ids
    @no_action_mades = @user_behaviour_result.no_action_made_ids
    @not_made_reasons = NotMadeReason.public_only + [ OpenStruct.new({ id: 0, name: "Autre", other: true }) ]

    render_wizard
  end

  def update
    @user = current_user
    @user_behaviour_result = @user.user_behaviour_result
    @action_mades = @user_behaviour_result.action_made_ids
    @no_action_mades = @user_behaviour_result.no_action_made_ids

    case step
    when :start
      @user_behaviour_result.page_one = true
      form_params = start_params

    when :action
      @user_behaviour_result.page_two = true
      form_params = action_params

    when :no_action
      @user_behaviour_result.page_three = true
      form_params = no_action_params
      if params.dig(:user_behaviour_result, :other_label).present?
        new_reason =  NotMadeReason.create(reason: params.dig(:user_behaviour_result, :other_label))
        @user_behaviour_result.not_made_reasons << new_reason
      end

    when :at_work
      @user_behaviour_result.page_four = true
      form_params = at_work_params

    when :your_behaviour
      @user_behaviour_result.page_five = true
      form_params = your_behaviour_params

    when :after
      @user_behaviour_result.page_six = true
      form_params = after_params
    end

    @user_behaviour_result.update_attributes(form_params)
    render_wizard @user_behaviour_result

  end

  private

  def start_params
    params.require(:user_behaviour_result).permit(
      :starting_month
    )
  end

  def action_params
    params.require(:user_behaviour_result).permit(
      :actions_made_reasons,
      action_mades_attributes: {}
    )
  end

  def no_action_params
    params.require(:user_behaviour_result).permit(
      :actions_not_made_comment,
      no_action_mades_attributes: {}
    )
  end

  def at_work_params
    params.require(:user_behaviour_result).permit(
      :work_sorting_order,
      :work_sorting_applied,
      :work_trash_reduction,
      :work_trash_reduction_comment,
      :new_actions,
      :new_actions_comment,
      :more_actions,
      :more_actions_comment,
      :better_actions,
      :better_actions_comment,
    )
  end

  def your_behaviour_params
    params.require(:user_behaviour_result).permit(
      :context_knowledge,
      :context_knowledge_comment,
      :concerned,
      :concerned_comment,
      :favorable_reduction,
      :crappy_reduction,
      :trash_reduction_hard,
      :trash_reduction_hard_comment,
      :dedicated_employee,
      :dedicated_employee_comment,
      )
  end

  def after_params
    params.require(:user_behaviour_result).permit(
      :work_continue,
      :work_continue_comment,
      :home_continue,
      :home_continue_comment,
      :accompanier,
      :accompanier_comment
      )
  end
end
