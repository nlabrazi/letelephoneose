class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :availability

  after_create :reservation_send

  def reservation_send
    UserMailer.reservation_email(self).deliver_now
    UserMailer.reservation_artist_email(self).deliver_now
  end

end
