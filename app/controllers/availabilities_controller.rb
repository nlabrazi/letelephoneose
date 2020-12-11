class AvailabilitiesController < ApplicationController
  before_action :set_artist, only: [:show, :create, :destroy]

  def index
    @artists = policy_scope(Availability)
    @user = current_user
    @artist = Artist.find(session[:artist_id])
    @availabilities = @artist.availabilities
    if !@user.nil?
      authorize @user
    end
    session[:order_service_id] = session[:service_id]
    session[:order_artist_id] = session[:artist_id]
    session[:artist_id] = nil
    session[:service_id] = nil
  end

  def show
    @availability = Availability.new
  end

  def create
    @artist = Artist.find_by(user_id: current_user.id)
    @availability = Availability.new(avail_params)
    @availability.artist_id = @artist.id
    if @availability.slot
      flash.notice = "Votre disponibilité a bien été ajoutée"
      redirect_to dashboard_index_path
    else
      flash.alert = "Une erreur est survenue #{@availability.errors.messages}"
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    if @availability.destroy
      flash.notice = "Votre disponibilité a bien été SUPPRIME"
      redirect_to dashboard_index_path
    else
      flash.alert = "Une erreur est survenue #{@availability.errors.messages}"
      redirect_to dashboard_index_path
    end
  end

  def set_artist
    @artist = Artist.find_by(user_id: current_user.id)
    authorize @artist
  end

  private

  def avail_params
    params.require(:availability).permit(:start_date, :end_date)
  end

end
