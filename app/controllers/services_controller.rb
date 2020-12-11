class ServicesController < ApplicationController
  before_action :set_session, only: [:index, :show]

  def index
    @services = policy_scope(Service)
  end

  private

  def set_session
    session[:artist_id] = params.require(:artist_id) if params[:artist_id]
    redirect_to availabilities_path if session[:artist_id] && session[:service_id]
  end
end