class OrdersController < ApplicationController

  def index
    @user = current_user
    @artist = Artist.find(params[:artist_id])
    @availabilities = @artist.availabilities
    authorize @user
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @user = current_user
    @artist = Artist.find(params[:artist_id])
    @availabilities = @artist.availabilities
    authorize @user

  end
  def create
    @user = current_user
    @availability = Availability.find(params[:availability_id])
    @order = Order.new
    @order.user = current_user
    @order.service_id = 1
    @order.availability_id = @availability.id
    @availability.is_booked = true
    if @order.save && @availability.save
      flash.notice = "Votre réservation a bien été créée"
      render :show
    else
      flash.alert = "Une erreur est survenue #{@order.errors.messages}"
      redirect_to root_path
    end
    authorize @user
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:availibility_id)
  end

end
