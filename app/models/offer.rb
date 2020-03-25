class Offer < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :travel
  validates_presence_of :description
end
