class Contact < ApplicationRecord

	validates :name, :presence => :true
	validates :email, 
    :presence => :true,
    :format => { 
      :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      :message => "L'adresse mail doit être valide."
    }
  validates :message, :presence => :true

end
