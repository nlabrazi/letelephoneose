class ChargesController < ApplicationController
    before_action :set_user, only: [:new, :create]

    def new
      @availability = Availability.find(params[:availability_id])
      @artist = Artist.find(@availability.artist_id)
      @order = Order.find(params[:order_id])
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
end