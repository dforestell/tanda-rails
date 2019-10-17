class ShiftsController < ApplicationController
    def index
        authenticate!
        @organization = Organization.find(params[:organization_id])
        @shifts = @organization.shifts.order(:start)
    end

    def create
        @shift = Shift.new
        redirect_back if current_user.organization_id != params[:organization_id]
        @shift.user = current_user
        @date = "#{params['date(3i)']}/#{params['date(2i)']}/#{params['date(1i)']}"
        @start = @date + " #{params['start(4i)']}:#{params['start(5i)']}"
        @finish = @date + " #{params['finish(4i)']}:#{params['finish(5i)']}"
        @shift.start = @start.to_datetime
        @shift.finish = @finish.to_datetime
        @shift.break = (params[:break]).to_i

        if @shift.save
            redirect_to organization_shifts_path(params[:organization_id])
        else
            flash[:error] = @shift.errors.full_messages.to_sentence
            redirect_to organization_shifts_path(params[:organization_id])
        end
    end

    def edit
        @shift = Shift.find(params[:id])
        @organization = Organization.find(params[:organization_id])
        redirect_back(fallback_location: organization_shifts_path(@organization, @shift)) unless current_user.id == @shift.user_id
    end

    def update
        @shift = Shift.find(params[:id])
        redirect_back(fallback_location: organization_shifts_path(@organization, @shift)) unless current_user.id == @shift.user_id
        @date = "#{params['date(3i)']}/#{params['date(2i)']}/#{params['date(1i)']}"
        @start = @date + " #{params['start(4i)']}:#{params['start(5i)']}"
        @finish = @date + " #{params['finish(4i)']}:#{params['finish(5i)']}"
        @shift.start = @start.to_datetime
        @shift.finish = @finish.to_datetime
        @shift.break = (params[:break]).to_i

        if @shift.save
            redirect_to organization_shifts_path(params[:organization_id])
        else
            flash[:error] = @shift.errors.full_messages.to_sentence
            redirect_to organization_shifts_path(params[:organization_id])
        end
    end

    def destroy
        @shift = Shift.find(params[:id])
        if current_user.id == @shift.user_id
            @shift.destroy
        end
            redirect_to organization_shifts_path(params[:organization_id])
    end

end