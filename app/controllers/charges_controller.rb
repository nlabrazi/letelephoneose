class ChargesController < ApplicationController
    before_action :set_user, only: [:new, :create]

    def new
      @availability = Availability.find(params[:availability])
      session[:order_id] = params[:order_id]
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
          success_url: dashboard_index_url + '?session_id={CHECKOUT_SESSION_ID}',
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
    def create_order(availability)
      order = Order.new
      order.user_id = current_user.id
      order.availability_id
      order.service_id = 1
      order.description = "test du paiement"
      if order.save
        availability.status = "paid"
        availability.is_booked = true 
        availability.save
      else
        flash.notice = "un probleme est survenu lors du paiment"
        redirect_to root_path
      end
    end
end


### snippet pour gerer le message de succes
###<div class="container text-center my-5">
###  <h1>Succès</h1>
###  <p>Nous avons bien reçu votre paiement de <%= number_to_currency(@payment_intent.amount_received / 100.0, unit: "€", separator: ",", delimiter: "", format: "%n %u") %>.</p>
###  <p>Le statut de votre paiement est : <%= @payment_intent.status %>.</p>
###</div>

