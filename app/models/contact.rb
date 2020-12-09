class Contact < ApplicationRecord

	validates :name, :presence => :true, :error => "Votre nom est obligatoire."
	validates :email, 
    :presence => :true,
    :format => { 
      :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      :message => "L'adresse mail doit être valide."
      :error => 'Votre email est obligatoire.'
    }
  validates :message, :presence => :true

end
