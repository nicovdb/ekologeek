class CollectsController < ApplicationController

  def new
    @collect = Collect.new
    @bins = current_user.company.bins
  end

  def create
    @collect = Collect.new(collect_params)
    @bins = current_user.company.bins
    if @collect.end_at <= current_user.company.project.diagnostic_end_at
      @collect.status = "diagnostic"
    elsif @collect.start_at >= current_user.company.project.bilan_start_at
      @collect.status = "bilan"
    else
      @collect.status = "suivi"
    end
    if @collect.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def collect_params
    params.require(:collect).permit(:start_at, :end_at, :filled_rate, :comment, :status, :bin_id)
  end

end
