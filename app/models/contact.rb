class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :file, attachment: true

  attribute :message
	# validates :name, :presence => :true
	# validates :email,
  #   :presence => :true,
  #   :format => {
  #     :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
  #     :message => "L'adresse mail doit être valide.",
  #     :error => 'Votre email est obligatoire.'
  #   }
  # validates :message, :presence => :true
  attribute :nickname, captcha: true

  def headers
    {
    subject: "contact Form",
    to: 'letelephoneose@yopmail.com',
    from: %("#{name}" <#{email}>)
    }
  end
end
