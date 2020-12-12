class Artist < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :orders, through: :availabilities
  has_one_attached :artist_pp

  validates :name, presence: true, length: { in: 1..50  }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :user_id, uniqueness: true


  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: :name, using: {
    tsearch: { prefix: true }
  }

  require "open-uri"

  def self.artist_creation(user)
    @artist = Artist.new(name: "Votre Nom d'artiste", description: "Une belle description pour vos futurs fans!", user_id: user.id)
    photo = URI.open("https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8&ixlib.jpg")
    @artist.artist_pp.attach(io: photo, filename: 'artist_pp', content_type: 'image/jpg')
    @artist.save
  end

end
