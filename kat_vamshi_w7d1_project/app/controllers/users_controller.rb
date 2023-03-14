class UsersController < ApplicationController 
before_action :require_logged_out, only: [:new, :create]
    def new 
        @user = User.new 
        render :new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save!
            redirect_to root_url
        else  
            render json: @user.errors.full_messages, status: 422
        end
    end

    def show 
        @user = User.find(params[:id])
        render :show
    end

    def index 
        @users = User.all 
        render :index 
    end

    private 
    def user_params 
        params.require(:user).permit(:username, :session_token, :password_digest, :password)
    end

end