class PropertyOwnersController < ApplicationController
  before_action :set_property_owner, only: [:show, :edit, :update, :destroy]

  # GET /property_owners
  # GET /property_owners.json
  def index
    @property_owners = PropertyOwner.all
  end

  # GET /property_owners/1
  # GET /property_owners/1.json
  def show
  end

  # GET /property_owners/new
  def new
    @property_owner = PropertyOwner.new
  end

  # GET /property_owners/1/edit
  def edit
  end

  # POST /property_owners
  # POST /property_owners.json
  def create
    @property_owner = PropertyOwner.new(property_owner_params)

    respond_to do |format|
      if @property_owner.save
        format.html { redirect_to @property_owner, notice: 'Property owner was successfully created.' }
        format.json { render :show, status: :created, location: @property_owner }
      else
        format.html { render :new }
        format.json { render json: @property_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_owners/1
  # PATCH/PUT /property_owners/1.json
  def update
    respond_to do |format|
      if @property_owner.update(property_owner_params)
        format.html { redirect_to @property_owner, notice: 'Property owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_owner }
      else
        format.html { render :edit }
        format.json { render json: @property_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_owners/1
  # DELETE /property_owners/1.json
  def destroy
    @property_owner.destroy
    respond_to do |format|
      format.html { redirect_to property_owners_url, notice: 'Property owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_owner
      @property_owner = PropertyOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_owner_params
      params.require(:property_owner).permit(:first_name, :last_name, :owner_address, :owner_phone, :number_of_properties)
    end
end
