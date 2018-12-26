class ComportamentalFormulairesController < ApplicationController
  include Wicked::Wizard

  layout "connected"

  steps :page_one, :page_two, :page_three, :page_four, :page_five

  def show
    @user = current_user
    @formulaire = @user.user_behaviour_diag

    render_wizard
  end

  private

  def form_params
    params.require(:form).permit!
  end


end
