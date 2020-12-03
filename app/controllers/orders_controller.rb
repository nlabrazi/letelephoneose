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
    #@availability = Availability.find(params[:id])
    @user = current_user
    @artist = Artist.find(params[:artist_id])
    @availabilities = @artist.availabilities
    authorize @user

  end
  def create
    @availability = availability.find(params[:availibility_id])
    @order = Order.new
    @order.user = current_user
    @order.availability = @availability
    @order.service = 1

    if order.save
      flash.notice = "Votre réservation a bien été créée"
      render :show
    else
      flash.alert = "Une erreur est survenue #{@order.errors.messages}"
      redirect_to root_path
    end

  end

  private

  def order_params
    params.require(:order).permit(:user_id,:availibility_id)
  end

end
