class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :availability

  after_create :reservation_send
  after_update :confirmation_send

  def reservation_send
    UserMailer.reservation_email(self).deliver_now
    UserMailer.reservation_artist_email(self).deliver_now
  end

  def confirmation_send
    if(self.status == 'confirmed')
      UserMailer.confirmation_order(self).deliver_now
    end
    if(self.status == 'rejected')
      UserMailer.refuse_order(self).deliver_now
    end
  end

end
