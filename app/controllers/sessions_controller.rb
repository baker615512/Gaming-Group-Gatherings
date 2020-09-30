class SessionsController < ApplicationController
  def welcome
  end
  
  def new
  end

  def create
    @gamer = Gamer.find_by(username: params[:gamer][:username])
    if @gamer && @gamer.authenticate(params[:gamer][:password])
      redirect_to_gamer_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def omniauth
    @gamer = Gamer.from_omniauth(auth)
    @gamer.save
    redirect_to_gamer_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def redirect_to_gamer_path
    session[:gamer_id] = @gamer.id
    redirect_to gamer_path(@gamer)
  end
end
