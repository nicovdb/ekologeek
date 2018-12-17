class ChartsController < ApplicationController

  layout "charts"

  def index
    @collects = Collect.all
    @bins = Bin.all
  end
end
