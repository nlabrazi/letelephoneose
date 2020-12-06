class Artist < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :orders, through: :availabilities
  has_one_attached :artist_pp
  validates :user_id, uniqueness: true
end
