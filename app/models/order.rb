class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :availability
end
