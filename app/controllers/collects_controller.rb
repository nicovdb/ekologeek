class CollectsController < ApplicationController

  before_action :set_bins, only: [ :edit, :update]

  layout "connected"

  def new
    @collect = Collect.new
    if current_user.admin?
      @bins = Bin.all.sort_by{ |bin| bin.company.name}
    else
      @bins = current_user.bins
    end

    sql = "SELECT end_at, bins.id FROM collects
          JOIN bins ON bins.id = collects.bin_id
          JOIN companies ON companies.id = bins.company_id
          WHERE companies.id = #{current_user.company.id }"
    sql_result = ActiveRecord::Base.connection.execute(sql).to_a
    grouped = sql_result.group_by{|collect| collect["id"]}
    @collects_end = grouped.to_a.map do |group|
      group[1].max_by {|element| element["end_at"].to_date }
    end
  end

  def create
    @collect = Collect.new(collect_params)
    if current_user.admin?
      @bins = Bin.all.sort_by{ |bin| bin.company.name}
    else
      @bins = current_user.bins
    end
    if !@collect.end_at.nil? && @collect.end_at <= @collect.bin.company.project.diagnostic_end_at
      @collect.status = "diagnostic"
    elsif !@collect.start_at.nil? && @collect.start_at >= @collect.bin.company.project.bilan_start_at
      @collect.status = "bilan"
    else
      @collect.status = "suivi"
    end
    if @collect.save
      @collect.weight_person_day = @collect.add_weight_person_day
      if @collect.save
        redirect_to donnees_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def index
    @trash_diagnostic = current_user.company.trash_diagnostic

    if current_user.admin
      @collects = Collect.all.sort_by{ |collect| collect.company.name }
      @users = User.all.sort_by { |user| user.company.name}
    else
      @collects = current_user.collects
      @users = current_user.company.users
    end


  end

  def edit
    @collect = Collect.find(params[:id])
  end

  def update
    @collect = Collect.find(params[:id])
    @collect.update_attributes(collect_params)
    if @collect.save
      @collect.weight_person_day = @collect.add_weight_person_day
      if @collect.save
        redirect_to donnees_path
      else
        render :edit
      end
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
