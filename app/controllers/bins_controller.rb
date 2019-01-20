class BinsController < ApplicationController

  layout "connected"

  def index
    if current_user.admin?
      @bins = Bin.all.sort_by { |bin| bin.company.name }
    else
      @bins = current_user.company.bins
    end
  end

  def new
    @bin = Bin.new
    @trashes = Trash.where(display: true)
    @trash = Trash.new
  end

  def create
    @trash = Trash.new
    @trashes = Trash.where(display: true)
    unless params["bin"]["trash"]["name"].nil?
      trash_name = params["bin"]["trash"]["name"]
      if trash_name != ""
        @new_trash = Trash.new(name: trash_name)
        @new_trash.save
      end
    end
    @bin = Bin.new(bin_params)
    if @bin.company_id.nil?
      @bin.company = current_user.company
    end
    if !@new_trash.nil?
      @bin.trashes << @new_trash
    end
    if @bin.save
      redirect_to bins_path
    else
      render :new
    end
  end

  def edit
    @bin = Bin.find(params[:id])
    @trashes = Trash.where(display: true) + @bin.trashes.select{ |trash| trash.display == false}
    @trash = Trash.new
  end

  def update
    @trash = Trash.new
    @bin = Bin.find(params[:id])
    @trashes = Trash.where(display: true) + @bin.trashes.select{ |trash| trash.display == false}
    @bin.update_attributes(bin_params)
    unless params["bin"]["trash"]["name"].nil?
      trash_name = params["bin"]["trash"]["name"]
      if trash_name != ""
        @new_trash = Trash.new(name: trash_name)
        if @new_trash.save
          @bin.trashes << @new_trash
        end
      end
    end

    if @bin.save
      redirect_to bins_path
    else
      render :edit
    end
  end

  def destroy
    @bin = Bin.find(params[:id])
    @bin.destroy
    redirect_to bins_path
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
                                :company_id,
                                trash_ids: [])
  end
end
