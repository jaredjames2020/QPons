class Company < ApplicationRecord
  has_many :offers, through: :paths
  belongs_to :paths
end
