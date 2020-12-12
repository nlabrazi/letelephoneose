class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://letelephoneose.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Le Telephone Ose !')
  end

  def reservation_email(order)
    @user = order.user
    @order = order
    @url  = 'http://letelephoneose.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Confirmation réservation !')
  end

  def reservation_artist_email(order)
    @user =  order.availability.artist.user
    @order = order
    @url  = dashboard_index_url
    mail(to: @user.email, subject: 'Nouvelle réservation !')
  end

  def confirmation_order(order)
    @user =  order.user
    @order = order
    @url  = 'http://letelephoneose.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "Ta commande a été confirmée par l'artiste.")
  end

  def refuse_order(order)
    @user =  order.user
    @order = order
    @url  = 'http://letelephoneose.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "Malheuresemement ta commande a été refusée par l'artiste.")
  end

end
