class Company < ApplicationRecord
  belongs_to :user, optional: true
  has_many :offers
  has_many :travels, through: :offers
  accepts_nested_attributes_for :offers
  validates_presence_of :name, :location
  scope :food, -> {where(category: 'Food') }
  scope :technology, -> {where(category: 'Technology') }
  scope :clothing, -> {where(category: 'Clothing') }
  scope :auto, -> {where(category: 'Auto') }
  scope :footwear, -> {where(category: 'Footwear') }
  scope :drugstore, -> {where(category: 'Drugstore') }



  def company_offers_path

  end



end
