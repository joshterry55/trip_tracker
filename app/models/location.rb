class Location < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :trip
end
