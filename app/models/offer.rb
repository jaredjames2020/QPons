class Offer < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :travel
  # accepts_nested_attributes_for :company
  validates_presence_of :description
end
