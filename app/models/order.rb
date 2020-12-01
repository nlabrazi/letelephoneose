class Order < ApplicationRecord
  belongs_to :user, :service, :availibility
end
