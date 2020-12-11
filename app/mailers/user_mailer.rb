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
    @user =  order.availability.artist.user
    @order = order
    @url  = dashboard_index_url
    mail(to: @user.email, subject: 'Nouvelle reservation !')
  end

  def confirmation_order(order)
    @user =  order.user
    @order = order
    @url  = 'http://letelephoneose-beta.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "T'as commande a ete confirme par l'artiste")
  end

  def refuse_order(order)
    @user =  order.user
    @order = order
    @url  = 'http://letelephoneose-beta.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "Malheuresemement t'as commande a ete refusee par l'artiste")
  end

end
