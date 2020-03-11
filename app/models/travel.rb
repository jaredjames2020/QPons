class Travel < ApplicationRecord
  has_many :users
  has_many :offers
  has_many :companies, through: :offers
end
