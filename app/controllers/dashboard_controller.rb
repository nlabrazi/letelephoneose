class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = policy_scope(User)
    @orders = current_user.orders.paginate(page: params[:page])
    @artist = current_user.artist
    @availability = Availability.new

    update_order

    if params[:search]
      @search_results_posts = User.search_by_name(params[:search])
      respond_to do |format|
        format.js { render partial: 'search-results' }
      end
    else
      @users = User.all.paginate(page: params[:page])
    end
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
        order.update(status: 'paid')
        session[:order_id] = nil
      end
    end
  end
end
