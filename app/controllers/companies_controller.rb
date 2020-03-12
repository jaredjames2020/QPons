class CompaniesController < ApplicationController

  def new
    get_current_travel
    @company = Company.new
  end

  def index
    get_current_travel
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
      if @company.save
        redirect_to travel_path(params[:travel_id])
      else
        render :new
      end
  end

  def show
    @company = Company.find(params[:id])
  end


  private

  def company_params
    params.require(:company).permit(:company_id, :name, :location, :category)
  end

  def get_current_travel
    @travel ||= Travel.find_by(id: params[:travel_id])
  end

end
