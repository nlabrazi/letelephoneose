class Order < ApplicationRecord
  belongs_to :user, :service, :availability
end
