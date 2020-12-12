class Service < ApplicationRecord
  has_many :orders

  validates :name, presence: true,
            length: { maximum: 50 }
  validates :price, numericality: true,
            presence: true
  validates :description, presence: true,
            length: { maximum: 500 }
end
