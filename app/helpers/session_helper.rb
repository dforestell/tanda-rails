module SessionHelper
	
	def current_user
		@current_user ||= User.find_by(id: session[:id]) if session[:id]
	end

	def logged_in?
		session[:id] != nil
	end

	def authenticate!
    	redirect_to login_path unless logged_in?
	end

	def yours?
		redirect_back(fallback_location: organization_shifts_path(@organization, @shift)) unless current_user.id == @shift.user_id
	end
end