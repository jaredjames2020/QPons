class Company < ApplicationRecord
  belongs_to :user, optional: true
  has_many :offers
  has_many :travels, through: :offers
  accepts_nested_attributes_for :offers
  validates_presence_of :name, :location

  scope :category, ->(category) {where(category: category)}
  
end
