class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = policy_scope(User)
    @orders = current_user.orders.paginate(page: params[:page], per_page: 10)
    @artist = current_user.artist
    @availability = Availability.new
    @find_availabilities = Availability.where(artist_id: @artist)
    @find_orders = Order.where(availability_id: @find_availabilities)

    update_order

    if params[:search]

      @users_all = User.all
      @users = User.where(last_name: params[:search])
      respond_to do |format|
        format.js { render partial: 'search-results' }
      end
    else
      @users = User.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def update
    @user = User.find(params[:dashboard_id])
    @user.is_artist = true
    Artist.artist_creation(@user)
    @user.save
  end

  def remove_artist
    @user = User.find(params[:dashboard_id])
    @user.is_artist = false
    Artist.artist_creation(@user)
    @user.save
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def update_order
    if params[:session_id]
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      if @payment_intent.status == 'succeeded' && session[:order_id]
        order = Order.find(session[:order_id])
        order.update(status: 'pendingValidate')
        session[:order_id] = nil
      end
    end
  end
end
