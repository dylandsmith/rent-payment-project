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
      if @user.save
         redirect_to root_url, :notice => "Signed up!"
      else
         render "new"
      end
   end

   def show
     @units = []
      if @set_user.type == "PropertyOwner"
         @properties = @set_user.properties
         @set_user.properties.each do |property|
           @units.push(property.units)      
         end
      else
         @unit = @set_user.unit
         @property = @unit.property
      end
   end

   private

   def set_user
      @set_user = User.find(session[:user_id])
   end

   def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :type)
   end

end
