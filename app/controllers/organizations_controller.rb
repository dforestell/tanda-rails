class OrganizationsController < ApplicationController
    def show
        @organization = Organization.find(params[:id])
    end

    def index
        @organizations = Organization.all
    end

    def edit
        @organization = Organization.find(params[:id])
    end

    def update
        @organization = Organization.find(params[:id])
        @organization.name = params[:name]
        @organization.hourly_rate = params[:hourly_rate]        
        if @organization.save
            redirect_to organization_path(@organization)
        else 
            flash[:error] = @organization.errors.full_messages.to_sentence
            render :edit
        end
    end

    def create 
        if current_user.organization_id != nil
            flash[:error] = "Please quit your current job before starting a business"
            redirect_to organizations_path
        else
            @organization = Organization.new(name: params[:name], hourly_rate: params[:hourly_rate])
            if @organization.save
                current_user.organization = @organization
                current_user.save(:validate => false)
                redirect_to organization_path(@organization)
            else 
                flash[:error] = @organization.errors.full_messages.to_sentence
                render :index 
            end
        end
    end

end