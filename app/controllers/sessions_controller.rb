class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to organizations_path
        else 
            @error = "Invalid credentials"
            render :new
        end
    end

    def destroy
        session[:id] = nil
        flash[:success] = "You have logged out!"
        redirect_to login_path
    end
end