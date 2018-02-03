class Sessions::SessionsController < ApplicationController

  def new
  end

  def index
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_type] = user.user_designation
      session[:user_id] = user.id
      if user.user_designation == "PropertyOwner"
        redirect_to property_owner_path(user.user_designation), :notice => "Property Owner logged in"
      elsif
        redirect_to tenant_path(user.user_designation), :notice => "Tenant has logged in"
      end
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
