class ChartsController < ApplicationController

  layout "charts"

  def index
    @collects = Collect.all
    @bins = Bin.all
    @bin_types = current_user.bin_types
  end
end
