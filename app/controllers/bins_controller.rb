class BinsController < ApplicationController

  def new
    @bin = Bin.new
    @trashes = Trash.where(display: true)
    @trash = Trash.new
  end

  def create
    @bin = Bin.new(bin_params)
    @trash = Trash.new
    @trashes = Trash.where(display: true)
    unless params["trash"].nil?
      trash_name = params["trash"]
      @trash = Trash.new(name: trash_name)
      @trash.save
    end
    if @bin.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def bin_params
    params.require(:bin).permit!
  end

end
