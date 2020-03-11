class Company < ApplicationRecord
  has_many :travels, through: :offers
  has_many :offers
  validates_presence_of :name, :location

  def company_offers_path
    binding.pry
  end


end
