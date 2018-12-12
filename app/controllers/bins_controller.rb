class BinsController < ApplicationController

  def new
    @bin = Bin.new
    @trashes = Trash.all
  end

  def create
    @bin = Bin.new(bin_params)
    if @bin.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def bin_params
    params.require(:bin).permit(:volume, :collector, :shared, :cost, :name)
  end

end
