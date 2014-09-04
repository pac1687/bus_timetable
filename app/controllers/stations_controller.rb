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
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(params[:station])
      flash[:notice] = "#{@station.name} was updated."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "Deleted."
    redirect_to stations_path
  end

end
