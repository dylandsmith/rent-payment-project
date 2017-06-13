class WorkspaceController < ApplicationController
  def index
  end
  
  def show
    @tenant = Tenant.find(session[:user_id])
  end
end
