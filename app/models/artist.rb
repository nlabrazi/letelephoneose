class Artist < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  #has_many :orders through: :availabilities
end
