class ShiftsController < ApplicationController
    def index
        @organization = Organization.find(params[:organization_id])
        @shifts = @organization.shifts 
    end
end