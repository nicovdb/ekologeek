class BinsController < ApplicationController

  layout "connected"

  def new
    @bin = Bin.new
    @trashes = Trash.where(display: true)
    @trash = Trash.new
    @bins = current_user.company.bins
  end

  def create
    @trash = Trash.new
    @trashes = Trash.where(display: true)
    @bins = current_user.company.bins
    unless params["bin"]["trash"]["name"].nil?
      trash_name = params["bin"]["trash"]["name"]
      @new_trash = Trash.new(name: trash_name)
      @new_trash.save
    end
    @bin = Bin.new(bin_params)
    @bin.company = current_user.company
    @bin.trashes << @new_trash
    if @bin.save
      redirect_to new_bin_path
    else
      render :new
    end
  end

  def edit
    @bin = Bin.find(params[:id])
    @trashes = Trash.where(display: true)
    @trash = Trash.new
    @bins = current_user.company.bins
  end

  def update
    @bin = Bin.find(params[:id])
    @trashes = Trash.where(display: true)
    @bin.update_attributes(bin_params)
    if @bin.save
      redirect_to new_bin_path
    else
      render :edit
    end
  end

  def destroy
    @bin = Bin.find(params[:id])
    @bin.destroy
    redirect_to new_bin_path
  end

  private

  def bin_params
    params.require(:bin).permit(:bin_type_id,
                                :shared,
                                :volume,
                                :cost,
                                :frequency_number,
                                :frequency_periodicity,
                                :frequency_day,
                                :collector,
                                trash_ids: [])
  end

end
