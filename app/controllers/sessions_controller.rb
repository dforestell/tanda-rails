class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            flash[:success] = "You have successfully logged in"
            redirect_to root_path
        else
            flash[:error] = "Email or password is invalid"
            render :new
        end
    end

    def destroy
        session[:id] = nil
        flash[:success] = "You have logged out!"
        redirect_to root_path
    end
end