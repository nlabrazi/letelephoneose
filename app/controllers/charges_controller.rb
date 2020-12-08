class ChargesController < ApplicationController
    before_action :set_user, only: [:new, :create]

    def new
    end
    
    def create
        @user = current_user
        @total = params[:total].to_d
        @session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [
            {
              name: 'Rails Stripe Checkout',
              amount: (@total*100).to_i,
              currency: 'eur',
              quantity: 1
            },
          ],
          success_url: root_url + '?session_id={CHECKOUT_SESSION_ID}',
          cancel_url: root_url
        )
        respond_to do |format|
          format.js # renders create.js.erb
        end
    end
    private
    def set_user
        @user = current_user
        authorize @user
    end
end


### snippet pour gerer le message de succes
###<div class="container text-center my-5">
###  <h1>Succès</h1>
###  <p>Nous avons bien reçu votre paiement de <%= number_to_currency(@payment_intent.amount_received / 100.0, unit: "€", separator: ",", delimiter: "", format: "%n %u") %>.</p>
###  <p>Le statut de votre paiement est : <%= @payment_intent.status %>.</p>
###</div>

