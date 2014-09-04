class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(params[:station])
    if @station.save
      flash[:notice] = "#{@station.name} was added to the Bus Timetable."
      redirect_to("/stations/#{@station.id}")
    else
      @stations = Station.all
      render('/stations/new')
    end
  end

end
