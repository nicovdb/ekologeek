class TrashDiagnosticsController < ApplicationController
  def new
    @trash_diagnostic = TrashDiagnostic.new
  end

  def create
    @trash_diagnostic = TrashDiagnostic.new(trash_diagnostic_params)
    @trash_diagnostic.company = current_user.company
    if @trash_diagnostic.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def trash_diagnostic_params
    params.require(:trash_diagnostic).permit(:annual_cost, :reduction_objective)
  end
end
