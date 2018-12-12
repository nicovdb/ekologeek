class BinsController < ApplicationController

  def new
    @bin = Bin.new
    @trashes = Trash.where(display: true)
    @trash = Trash.new
  end

  def create

    # @trash = Trash.new
    @trashes = Trash.where(display: true)

    unless params["bin"]["trash"]["name"].nil?
      trash_name = params["bin"]["trash"]["name"]
      @new_trash = Trash.new(name: trash_name)
      @new_trash.save
    end

    @bin = Bin.new(bin_params)
    @bin.company = current_user.company
    @bin.trash_ids << @new_trash.id.to_s

    if @bin.save!
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def bin_params
    params.require(:bin).permit(:name, :shared, :volume, :frequency_number, :frequency_periodicity, :frequency_day, :collector, :trash_ids)
  end

end
