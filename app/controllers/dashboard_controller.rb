class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = policy_scope(User)
    @users = User.all.paginate(page: params[:page])
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

end
