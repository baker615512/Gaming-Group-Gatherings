class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :require_login
    
    private

    def current_user
        @current_user ||= Gamer.find_by_id(session[:gamer_id])
    end

    def logged_in?
        !!current_user
    end
  
    def require_login
        if !logged_in?
            redirect_to root_path
        end
    end
end
