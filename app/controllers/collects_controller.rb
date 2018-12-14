class CollectsController < ApplicationController

  before_action :set_bins, only: [:new, :create, :edit, :update]

  layout "connected"

  def new
    @collect = Collect.new
  end

  def create
    @collect = Collect.new(collect_params)
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

  def index
    @collects = current_user.collects
  end

  def edit
    @collect = Collect.find(params[:id])
  end

  def update
    @collect = Collect.find(params[:id])
    @collect.update_attributes(collect_params)
    if @collect.save
      redirect_to donnees_path
    else
      render :edit
    end
  end

  def destroy
    @collect = Collect.find(params[:id])
    @collect.destroy
    redirect_to donnees_path
  end

  private

  def collect_params
    params.require(:collect).permit(:start_at, :end_at, :filled_rate, :comment, :status, :bin_id)
  end

  def set_bins
    @bins = current_user.company.bins
  end


end
