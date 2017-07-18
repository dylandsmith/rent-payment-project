class MaintanenceServiceController < ApplicationController
  before_action :set_user
  def index
  end

  def new
    @maintanence_service = MaintanenceService.new
  end

  def create
    @maintanence_service = MaintanenceService.new(maintanence_service_params)
    @maintanence_service.user_id = @set_user.id
    @maintanence_service.unit_id = @set_user.unit_id
    if @maintanence_service.save
      redirect_to tenant_path(session[:user_type]), :notice => "You're service request has been sent!"
    else
      render "show"
    end
  end

  def show
  end
  
  private
  
  def set_user
     @set_user = User.find(session[:user_id])
  end
  
  def maintanence_service_params
    params.require(:maintanence_service).permit(:location, :maintanence_type, :desc, :time, :emergency)
  end
end
