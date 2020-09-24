class SessionsController < ApplicationController
  def welcome
  end
  
  def new
  end

  def create
    @gamer = Gamer.find_by(username: params[:gamer][:username])
    if @gamer && @gamer.authenticate(params[:gamer][:password])
      session[:gamer_id] = @gamer.id
      redirect_to '/gamer/:id'
    else
      render :new
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
