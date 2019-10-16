class ShiftsController < ApplicationController
    def index
        @organization = Organization.find(params[:organization_id])
        @shifts = @organization.shifts 
    end

    def create
        @shift = Shift.new
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

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"1hhVg42oHpV3+qWZEMESdZhzLNPkj+lRDFSFWw3VlBBWK3i7jPisw+Op5eC46f7XkdRpL9ZUvWsac6q6CYPNkQ==", "date(2i)"=>"10", "date(3i)"=>"16", "date(1i)"=>"2019", "start(1i)"=>"2019", "start(2i)"=>"10", "start(3i)"=>"16", "start(4i)"=>"15", "start(5i)"=>"52", "finish(1i)"=>"2019", "finish(2i)"=>"10", "finish(3i)"=>"16", "finish(4i)"=>"20", "finish(5i)"=>"52", "break"=>"25", "commit"=>"Create Shift", "organization_id"=>"2"}

end