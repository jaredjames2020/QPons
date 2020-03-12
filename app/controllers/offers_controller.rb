class OffersController < ApplicationController

  def new
    @offer = Offer.new
    find_travel
  end

  def index
    @offers = Offer.all
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company_attributes={ name: params[:offer][:companies][:name],
                                location: params[:offer][:companies][:location],
                                category: params[:offer][:companies][:category]
                              }
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
    params.require(:offer).permit(:description, :company_id, :travel_id, company: [:name, :location, :category])
  end

  def find_travel
    @travel = Travel.find(params[:travel_id])
  end

  def set_travel
    @travel = Travel.find(params[:offer][:travel_id])
  end

end
