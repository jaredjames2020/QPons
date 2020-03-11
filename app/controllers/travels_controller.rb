class TravelsController < ApplicationController

  def new
    @travel = Travel.new
  end

  def index
    @travels = Travel.all
  end

  def create
    @travel = Travel.new(travel_params)
      if @travel.save
        redirect_to travels_path
      else
        render :new
      end
  end

  def show
    @travel = Travel.find(params[:id])
  end


  private

  def travel_params
    params.require(:travel).permit(:name)
  end

end
