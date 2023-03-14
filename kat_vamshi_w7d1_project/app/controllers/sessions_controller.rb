class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    def new 
        @user = User.new
        render :new
    end

    def create 
        incoming_username = params[:user][:username]
        incoming_password = params[:user][:password]
        @user = User.find_by_credentials(incoming_username, incoming_password)
        if @user 
           login(@user)
           redirect_to root_url 
        else  
            render :new 
        end

    end

    def destroy
        logout 
        redirect_to new_session_url
    end


end