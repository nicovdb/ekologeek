class ComportamentalFormulairesController < ApplicationController
  include Wicked::Wizard

  layout "connected"

  steps :page_one, :page_two, :page_three, :page_four, :page_five

  def new
    @user = current_user
    @user_behaviour_diag = UserBehaviourDiag.new(user_id: @user.id)
    if @user_behaviour_diag.save
      redirect_to comportamental_formulaire_path(:page_one)
    end
  end

  def show
    @user = current_user
    @user_behaviour_diag = @user.user_behaviour_diag
    @priority_action = PriorityAction.new(user_behaviour_diag_id: @user_behaviour_diag.id )
    # @priority_action.save
    @priority_actions = @user_behaviour_diag.priority_action_ids

    render_wizard
  end

  def update
    @user = current_user
    @user_behaviour_diag = @user.user_behaviour_diag
    @priority_actions = @user_behaviour_diag.priority_action_ids

    case step
    when :page_one
      @user_behaviour_diag.page_one = true
      form_params = step_one_params
    when :page_two
      @user_behaviour_diag.page_two = true
      form_params = step_two_params
    when :page_three
      @user_behaviour_diag.page_three = true
      form_params = step_three_params
    when :page_four
      @user_behaviour_diag.page_four = true
    when :page_five
      @user_behaviour_diag.page_five = true
    end
    @user_behaviour_diag.update_attributes(form_params)

    render_wizard @user_behaviour_diag
  end

  private

  def step_one_params
    params.require(:user_behaviour_diag).permit(
      :work_sorting_order,
      :work_sorting_applied,
      :work_trash_reduction,
      :work_trash_reduction_comment,
      :home_sorting_order,
      :home_sorting_applied,
      :home_trash_reduction,
      :home_trash_reduction_comment
    )
  end

  def step_two_params
    params.require(:user_behaviour_diag).permit(
      :context_knowledge,
      :context_knowledge_comment,
      :concerned,
      :favorable_reduction,
      :crappy_reduction,
      :trash_reduction_hard,
      :dedicated_employee
    )
  end

  def step_three_params
    params.require(:user_behaviour_diag).permit(priority_actions_attributes:{})
  end


end
