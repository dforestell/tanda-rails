class UsersController < ApplicationController
    def new
        @user = User.new
    end


    def create
        @user = User.new(registration_params)
        if @user.save
            session[:id] = @user.id
            flash[:success] = "You have successfully Signed up"
            redirect_to organizations_path
        else
            flash[:error] = @user.errors.full_messages.to_sentence
            redirect_to new_user_path
        end
    end



    private 

    def registration_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
