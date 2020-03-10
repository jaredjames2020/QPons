class Path < ApplicationRecord
  has_many :users
  has_many :offers, through: :users
end
