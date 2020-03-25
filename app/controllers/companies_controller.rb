class CompaniesController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :get_current_companies, only: [:new, :create]

  def new
    get_current_travel
    current_user.companies.build
    @user = current_user
    @company = current_user.companies.new
    @travel = Travel.all
    @all_companies = Company.all
  end

  def index
    get_current_travel
    @user = current_user
    @companies = current_user.companies
    @company = current_user.companies.new
    @travel = Travel.all
    @all_companies = Company.all
  end

  def create
    @company = current_user.companies.new(company_params)
      if @company.save
        redirect_to companies_path
      else
        render :new
      end
  end

  def category
    @deals = Company.category(params[:category].capitalize)
  end

  private

  def company_params
    params.require(:company).permit(:company_id, :name, :location, :category, offers_attributes: [:description, :travel_id])
  end

  def get_current_travel
    @travel ||= Travel.find_by(id: params[:travel_id])
  end

  def get_current_companies
    @company ||=Company.find_by(id: params[:company_id])
  end

end
