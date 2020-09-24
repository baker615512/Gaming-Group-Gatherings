class GamersController < ApplicationController

    def new
        @gamer = Gamer.new
    end

    def create
        @gamer = Gamer.new(gamer_params)
        if @gamer.save
            session[:gamer_id] = @gamer.id
            redirect_to gamer_path(@gamer)
        else
            render :new
        end
    end
    
    def show
        @gamer = Gamer.find_by(params[:gamer_id])
    end

    private

    def gamer_params
        params.require(:gamer).permit(:username, :password)
    end
end
