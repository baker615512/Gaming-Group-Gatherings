class SessionsController < ApplicationController
  def welcome
  end
  
  def new
  end

  def create
    @gamer = Gamer.find_by(username: params[:gamer][:username])
    if @gamer && @gamer.authenticate(params[:gamer][:password])
      login_and_redirect
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
    login_and_redirect
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def login_and_redirect
    session[:gamer_id] = @gamer.id
    redirect_to home_path
  end
end
