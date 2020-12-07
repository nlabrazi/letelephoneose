class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://letelephoneose-beta.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Le Telephone Ose !')
  end

  def reservation_email(order)
    @user = order.user
    @order = order
    @url  = 'http://letelephoneose-beta.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Confirmation reservation !')
  end

  def reservation_artist_email(order)
    @user =  Order.last.availability.artist.user
    @order = order
    @url  = 'http://letelephoneose-beta.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Nouvelle reservation !')
  end

end
