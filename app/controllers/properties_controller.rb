class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show

  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    binding.pry
    # JSON.parse(params[:unitArrayToPass]) to get the units individually
    units = JSON.parse(params[:unitArrayToPass]) if params[:unitArrayToPass].present?
    @property = Property.new(property_params)
    if @property.save
      @property.users << User.find(session[:user_id])
      if units.present?
        units.each do |unit|
          Unit.create(address2: unit['unit'], 
            property_id: @property.id,
            rental_fee: unit['rent'],
            sq_ft: unit['area'],
            bdrms: unit['bdrms'],
            baths: unit['baths'],
            fl_lvl: unit['fllvl'])
        end
      end
      redirect_to property_owner_path(session[:user_type]), :notice => "New Property Added"
    else
      render "new"
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :st_add, :city, :state, :zip, :user_id, :number_of_units)
    end
end
