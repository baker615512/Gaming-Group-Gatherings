class SessionsController < ApplicationController
  def welcome
  end
  
  def new
  end

  def create
    @gamer = Gamer.find_by(username: params[:gamer][:username])
    if @gamer && @gamer.authenticate(params[:gamer][:password])
      session[:gamer_id] = @gamer.id
      redirect_to gamer_path(@gamer)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
