class TenantsController < ApplicationController
	before_action :set_tenant, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
		@states = CS.states(:us)
		@maintanence_service = MaintanenceService.new
		if @tenant.units.empty?
	    @units = Unit.all
	    @properties = Property.all
	  else
	  	
	  end
	end

	def get_city
		@cities = CS.cities(CS.states(:us).key(params[:State]))
		render '_get_city_form'
	end

	def get_apts
		@apts = Property.where(city: params[:City])
		render '_get_apts_form'
	end

	def get_units
		@units = Property.find(params[:Apts]).units
		render '_get_units_form'
	end

	def associate_tenant
		User.find(current_user.id).units << Unit.find(params[:Units])
		redirect_to tenant_path(current_user.id), :notice => "Signed up!"
	end

	private

	def set_tenant
		@tenant = Tenant.find(session[:user_id])
	end
end