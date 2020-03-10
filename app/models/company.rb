class Company < ApplicationRecord
  has_many :paths, through: :offers
  has_many :offers
end
