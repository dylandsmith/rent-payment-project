class UsersController < ApplicationController
  layout 'application'
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @property_owners = User.where(type: "PropertyOwner")
    @tenants = User.where(type: "Tenant")
  end

  def create
    @user = User.new(user_params)
    #@user.type = 'PropertyOwner'
    if @user.save
      session[:user_id] = @user.id
      if @user.user_designation == 'PropertyOwner'
        redirect_to property_owner_path(@user.user_designation), :notice => "Signed up!"
      else
        redirect_to tenant_path(@user.user_designation), :notice => "Signed up!"
      end
    else
       render "new"
    end
  end

  def show
   @maintanence_service = MaintanenceService.new
   @units = []
    if @set_user.user_designation == "PropertyOwner"
      @properties = @set_user.properties
      @set_user.properties.each do |property|
        @units.push(property.units)
      end
    else
      @unit = @set_user.units.first
      # @property = @unit.property
    end
  end

  private

    def set_user
      @set_user = User.find(session[:user_id])
      binding.pry
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_designation)
    end

end
