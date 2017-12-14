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
#     @user.type = "PropertyOwner"
     if @user.save
       redirect_to property_owner_path(@user), :notice => "Signed up!"
     else
       render "new"
     end
   end

   def show
     @maintanence_service = MaintanenceService.new
     
     @units = []
      if @set_user.type == "PropertyOwner"
        @property_owner = set_property_owner
        @user = User.new
        @data = @property_owner.get_data_structure
        @property = Property.new
        @units = Array.new{Unit.new}
      else
         @unit = @set_user.unit
         @property = @unit.property
      end
   end

   private

   def set_user
      binding.pry
      if(session[:user_id] != nil)
        @set_user = User.find(session[:user_id])
      else
        @set_user = User.find(params[:id])
      end
   end
   
   def set_property_owner
     PropertyOwner.find(params[:id])
   end
   
   def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :type)
   end

end
