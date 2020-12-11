class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :purge_session, only: [:create]

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @user = current_user
    @artist = Artist.find(session[:order_artist_id])
    @availability = Availability.find(params[:availability_id])
    authorize @user
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @availability = Availability.find(order_availability_params)
    @order.availability = @availability
    @order.service_id = Service.find(session[:order_service_id]).id

    @availability.is_booked = true

    @order.status = "pendingPaiement"

    if @order.save && @availability.save
      flash.notice = "Votre réservation a bien été créée"
      redirect_to new_availability_order_charge_path(order_id: @order, availability_id: @availability)
    else
      flash.alert = "Une erreur est survenue #{@order.errors.messages}"
      redirect_to root_path
    end
    authorize @order
  end

  def update
  end

  def validate
    @order = Order.find(params[:order_id])
    @availability = Availability.find(params[:availability_id])
    if @order.update(status: "confirmed")
      redirect_to dashboard_index_path, notice: "Commande acceptée"
    else
      flash.alert = "Une erreur est survenue #{@order.errors.messages}"
      redirect_to dashboard_index_path
    end
    authorize @order
  end

  def refused
    @order = Order.find(params[:order_id])
    @availability = Availability.find(params[:availability_id])
    @order.status = "rejected"
    if @order.save
      redirect_to dashboard_index_path, notice: "Commande refusée"
    else
      flash.alert = "Une erreur est survenue #{@order.errors.messages}"
      redirect_to dashboard_index_path
    end
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:target,:description)
  end

  def order_availability_params
    params.require(:availability_id)
  end

  def purge_session
    session[:order_service_id] = nil
    session[:order_artist_id] = nil
  end
end
