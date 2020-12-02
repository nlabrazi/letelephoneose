class Artist < ApplicationRecord
  belongs_to :user
  has_many :availibilities
  #has_many :orders through: :availibilities
end
