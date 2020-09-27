class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= Gamer.find_by_id(session[:gamer_id])
    end
end
