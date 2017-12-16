class TenantsController < ApplicationController
	before_action :set_tenant, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
    @maintanence_service = MaintanenceService.new
	end

	private

	def set_tenant
		@tenant = Tenant.find(session[:user_id])
	end
end