class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = policy_scope(User)
    @orders = current_user.orders.paginate(page: params[:page])
    @artist = current_user.artist

    if params[:search]
      @search_results_posts = User.search_by_name(params[:search])
      respond_to do |format|
        format.js { render partial: 'search-results'}
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

end
