class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_params)
      if @company.save
        redirect_to companies_path
      else
        render :new
      end
  end

  def show
    @company = Company.find(params[:id])
  end


  private

  def company_params
    params.require(:company).permit(:name, :location, :category)
  end

end
