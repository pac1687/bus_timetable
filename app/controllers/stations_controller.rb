class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @stations = Station.new
  end

end
