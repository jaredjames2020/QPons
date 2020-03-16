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

  def show
    get_travel_route ? (get_travel_route) : (redirect_to root_path)
  end

  def auto
    @auto = Company.auto
  end

  def clothing
    @clothing = Company.clothing
  end

  def drugstore
    @drugstore = Company.drugstore
  end

  def food
    @food = Company.food
  end

  def footwear
    @footwear = Company.footwear
  end

  def technology
    @technology = Company.technology
  end

  def all
    @offers = Offers.all
  end


  private

  def travel_params
    params.require(:travel).permit(:name)
  end

  def get_travel_route
    @travel ||= Travel.find_by(id: params[:id])
  end

end
