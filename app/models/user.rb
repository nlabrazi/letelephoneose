class User < ApplicationRecord
  has_many :orders
  has_one :artist
end
