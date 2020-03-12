class CompaniesController < ApplicationController

  def new
    get_current_travel
    @company = Company.new
  end

  def index
    get_current_travel
    @companies = Company.all
    @food = Company.food
  end

  def create
    @company = Company.new(company_params)
      if @company.save
        redirect_to travel_path(params[:travel_id])
      else
        render :new
      end
  end

  # def show
  #   # @company = Company.find(params[:id])
  # end

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

  private

  def company_params
    params.require(:company).permit(:company_id, :name, :location, :category)
  end

  def get_current_travel
    @travel ||= Travel.find_by(id: params[:travel_id])
  end

end
