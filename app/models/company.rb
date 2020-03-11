class Company < ApplicationRecord
  has_many :paths, through: :offers
  has_many :offers
  validates_presence_of :name, :location
end
