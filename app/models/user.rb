class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :artist
  has_one_attached :avatar

  after_create :welcome_send

  validates :first_name, length: { in: 1..50 }
  validates :last_name, length: { in: 1..50 }
  validates :phone, numericality: { only_integer: true },
            length: { is: 10 }
  self.per_page = 5

  include PgSearch
  pg_search_scope :search_by_name, against: [:first_name, :last_name],
                  using: {
                    tsearch: { prefix: true }
                  }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
