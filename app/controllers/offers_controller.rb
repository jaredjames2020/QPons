class OffersController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    # @offer = Offer.new
    # @companies = current_user.companies
    # @company = current_user.companies.new
    current_user.companies.build
    # @company.offers.build
    @user = current_user
    @companies = current_user.companies
    @company = current_user.companies.new
    @travel = Travel.all
    # @all_companies = Company.distinct.pluck(:category)
    @all_companies = Company.all
    find_travel
  end

  def index
      # @offers = Offer.all
      @offers = current_user.companies
  end

  def create
    @offer = Offer.new(offer_params)
      if @offer.save
        redirect_to travel_path(@offer.travel.id)
      else
        set_travel
        @offer.errors.full_messages
        redirect_to new_travel_offer_path(@travel)
      end
  end

  def show
    @offer = Offer.find(params[:id])
  end


  private

  def offer_params
    params.require(:offer).permit(:description, :travel_id, company_attributes: [:name, :location, :category])
  end

  def find_travel
    @travel = Travel.find(params[:travel_id])
  end

  def set_travel
    @travel = Travel.find(params[:offer][:travel_id])
  end


end
