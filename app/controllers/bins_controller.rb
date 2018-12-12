class BinsController < ApplicationController

  def new
    @bin = Bin.new
  end

  def create
    @bin = Bin.new(bin_params)

  end

  private

  def bin_params
    params.require(:bin).permit(:volume, :collector, :shared, :cost)
  end

end
