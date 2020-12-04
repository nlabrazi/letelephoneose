class AvailabilitiesController < ApplicationController
  before_action :set_artist, only: [:show, :create, :destroy]

  def show
    @availability = Availability.new
  end

  def create
    @artist = Artist.find_by(user_id: current_user.id)
    @availability = Availability.new(avail_params)
    @availability.artist_id = @artist.id
    if @availability.slot
      flash.notice = "Votre disponibilité a bien été ajoutée"
      redirect_to availability_path(current_user)
    else
      flash.alert = "Une erreur est survenue #{@availability.errors.messages}"
      render :show
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    if @availability.destroy
      flash.notice = "Votre disponibilité a bien été SUPPRIME"
      redirect_to availability_path(current_user)
    else
      flash.alert = "Une erreur est survenue #{@availability.errors.messages}"
      render :show
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
