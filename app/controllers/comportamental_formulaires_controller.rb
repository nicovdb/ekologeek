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

    render_wizard
  end

  def update
    @user = current_user
    @user_behaviour_diag = @user.user_behaviour_diag

    case step
    when :page_one
      @user_behaviour_diag.page_one = true
    when :page_two
      @user_behaviour_diag.page_two = true
    when :page_three
      @user_behaviour_diag.page_three = true
    when :page_four
      @user_behaviour_diag.page_four = true
    when :page_five
      @user_behaviour_diag.page_five = true
    end

    @user_behaviour_diag.update_attributes(form_params)

    render_wizard @user_behaviour_diag
  end

  private

  def form_params
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


end
