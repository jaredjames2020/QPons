class Company < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many :travels, through: :offers
  validates_presence_of :name, :location
  scope :food, -> {where(category: 'Food') }
  scope :technology, -> {where(category: 'Technology') }
  scope :clothing, -> {where(category: 'Clothing') }
  scope :auto, -> {where(category: 'auto') }
  scope :footwear, -> {where(category: 'Footwear') }
  scope :drugstore, -> {where(category: 'Drugstore') }


  def company_offers_path

  end


end
