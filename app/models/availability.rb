class Availability < ApplicationRecord
  belongs_to :order, :artist
end
