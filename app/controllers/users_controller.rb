class UsersController < ApplicationController
    skip_after_action :verify_authorized, only: [:show]
    def show
        @user = current_user
    end
end
