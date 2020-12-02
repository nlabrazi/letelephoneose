class DashboardArtistsController < ApplicationController
# before_action :set_artist, only: [:show, :create]

# 	def show
# 		#authorize @artist
# 		#@artist = Artist.find_by(user_id:current_user.id)
# 		@slot = Availability.new
# 	end

# 	def create
		
# 		@availability = Availability.new(artist_id:@artist, start_date: @slot.start_date, end_date: @slot.end_date, is_booked:false)

# 		if @availability.save
# 			flash.notice = "Votre disponibilité a bien été ajoutée"
# 			redirect_to root_path
# 		else
# 			flash.alert = "Une erreur est survenue #{@availability.errors.messages}"
# 			render :show
# 		end

# 	end

# 	def set_artist
#     @artist = Artist.find_by(user_id:current_user.id)
#     authorize @artist #pour le mettre un peu partout car define plus haut 😎
#   end
end
