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
            @errors = @user.errors.full_messages
            render :new
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.organization_id == nil
            p "in the if"
            @user.organization_id = params[:organization_id]
            @user.save(:validate => false)
            redirect_to organization_path(@user.organization)
        else
            flash[:error] = "You are already employed, please leave your other job first"
            redirect_to organizations_path
        end
    end

    def leave
        current_user.organization_id = nil
        current_user.save(:validate => false)
        flash[:success] = "You have left the organization"
        redirect_to organizations_path
    end



    private 

    def registration_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
