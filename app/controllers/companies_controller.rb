class CompaniesController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :get_current_companies, only: [:new, :create]

  def new
    get_current_travel
    # @company = Company.new
    current_user.companies.build
    # @company.offers.build
    @user = current_user
    # @companies = current_user.companies
    @company = current_user.companies.new
    @travel = Travel.all
    # @all_companies = Company.distinct.pluck(:category)
    @all_companies = Company.all
  end

  def index
    get_current_travel
    # @companies = Company.all
    # @food = Company.food
    # @user = User.find_by(id: session[:user_id])
    @user = current_user
    @companies = current_user.companies
    @company = current_user.companies.new
    @travel = Travel.all
    # @all_companies = Company.distinct.pluck(:category)
    @all_companies = Company.all
  end

  def create
    # if user_signed_in?
    @company = current_user.companies.new(company_params)
    # @company.offers.new.description = (params[:company][:offers_attributes]["0"][:description])
      if @company.save
        # redirect_to travel_path(params[:travel_id])
        redirect_to companies_path
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
    params.require(:company).permit(:company_id, :name, :location, :category, offers_attributes: [:description, :travel_id])
  end

  def get_current_travel
    @travel ||= Travel.find_by(id: params[:travel_id])
  end

  def get_current_companies
    @company ||=Company.find_by(id: params[:company_id])
  end

end
