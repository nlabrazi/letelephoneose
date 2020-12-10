class PagesController < ApplicationController
  before_action :purge_session

  private

  def purge_session
    session[:artist_id] = nil
    session[:service_id] = nil
  end
end
