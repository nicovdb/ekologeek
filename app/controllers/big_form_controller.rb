class BigFormController < ApplicationController
  include Wicked::Wizard

  steps :company_infos, :trash_gestion, :company_willing, :employees_willing, :referent_willing

  def show
    @user = User.last
    @application = @user.company.application

    render_wizard
  end

  def update
    @user = User.last
    @application = @user.company.application
    @application.update_atributes(params[:application])

    render_wizard @application
  end
end
