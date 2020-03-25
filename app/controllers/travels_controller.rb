class TravelsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :get_travel_route, only: [:new, :index]

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


  def category
    @deals = Company.category(params[:category].capitalize)
  end

  def show
    get_travel_route ? (get_travel_route) : (redirect_to root_path)
  end

  # def all
  #   @offers = Offers.all
  # end

  private

  def travel_params
    params.require(:travel).permit(:name)
  end

  def get_travel_route
    @travel ||= Travel.find_by(id: params[:id])
  end

end
