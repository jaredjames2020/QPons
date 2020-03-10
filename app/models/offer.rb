class Offer < ApplicationRecord
  belongs_to :companies
  has_many :users
end
