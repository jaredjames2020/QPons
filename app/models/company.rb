class Company < ApplicationRecord
  has_many :offers
  has_many :travels, through: :offers
  validates_presence_of :name, :location

  def company_offers_path

  end


end
