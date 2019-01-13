class TrashDiagnosticsController < ApplicationController

  layout "connected"

  def new
    @trash_diagnostic = TrashDiagnostic.new
  end

  def create
    @trash_diagnostic = TrashDiagnostic.new(trash_diagnostic_params)
    @trash_diagnostic.company = current_user.company
    if @trash_diagnostic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @trash_diagnostic = TrashDiagnostic.find(params[:id])
  end

  def update
    @trash_diagnostic = TrashDiagnostic.find(params[:id])
    @trash_diagnostic.update_attributes(trash_diagnostic_params)
    if @trash_diagnostic.save
      redirect_to donnees_path
    else
      render :edit
    end
  end

  private

  def trash_diagnostic_params
    params.require(:trash_diagnostic).permit(:annual_cost, :reduction_objective, :employees_nb)
  end
end
