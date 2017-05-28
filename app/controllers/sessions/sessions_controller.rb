class Sessions::SessionsController < ApplicationController

  def new
  end

  def index
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      binding.pry
      session[:user_type] = user.type
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
