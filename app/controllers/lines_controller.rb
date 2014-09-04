class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @stations = Station.all
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])
    if @line.save
      flash[:notice] = "#{@line.name} was added to the Bus Timetable."
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def edit
    @stations = Station.all
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(params[:line])
      flash[:notice] = "#{@line.name} was updated."
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

  def show
    @line = Line.find(params[:id])
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Deleted."
    redirect_to lines_path
  end
end
