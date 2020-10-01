class GamersController < ApplicationController

    def new
        @gamer = Gamer.new
    end

    def create
        @gamer = Gamer.new(gamer_params)
        if @gamer.save
            session[:gamer_id] = @gamer.id
            redirect_to home_path
        else
            render :new
        end
    end
    
    def home
        @gamer = current_user
    end

    private

    def gamer_params
        params.require(:gamer).permit(:username, :password)
    end
end
