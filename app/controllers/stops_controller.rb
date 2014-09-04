class StopsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @stops = Stop.all
  end

  def new
    @stations = Station.all
    @lines = Line.all
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(params[:stop])
    if @stop.save
      flash[:notice] = "#{@stop.station.name} and #{@stop.line.name} were joined as a stop."
      redirect_to stops_path
    else
      render 'new'
    end
  end

  def edit
    @stations = Station.all
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update(params[:stop])
      flash[:notice] = "#{@stop.name} was updated."
      redirect_to stop_path(@stop)
    else
      render 'edit'
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:notice] = "Deleted."
    redirect_to stops_path
  end
end
