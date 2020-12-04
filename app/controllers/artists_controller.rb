class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :set_admin, only: [:new]


  def index
    @artists = policy_scope(Artist)
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    authorize @artist

    if @artist.save
      redirect_to @artist, notice: "Artist créé"
    else
      render :new, notice: "ERREUR"
    end
  end

  def update
    @artist.update(artist_params)
    if @artist.save
      redirect_to artists_path, notice: "Artiste mis à jour"
    else
      render :edit, notice: "ERREUR"
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path, notice: "Artist supprimé"
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :user_id)
  end

  def set_artist
    @artist = Artist.find(params[:id])
    authorize @artist
  end
  def set_admin
    @admin = User.find(current_user.id)
    if User.find(current_user.id).is_admin
      authorize @admin
    end
  end
end
