class Path < ApplicationRecord
  has_many :users
  has_many :companies, through: :offers
end
