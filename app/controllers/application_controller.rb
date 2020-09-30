class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= Gamer.find_by_id(session[:gamer_id])
    end

    def logged_in?
        !!current_user
    end
  
    def redirect_if_not_logged_in
        if !logged_in?
            redirect '/'
        end
    end
end
