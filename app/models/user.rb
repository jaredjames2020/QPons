class User < ApplicationRecord
  has_many :offers
  has_many :companies
  has_many :travels, through: :offers
end
