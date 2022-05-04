class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]

  # GET /cities or /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1 or /cities/1.json
  def show
    @clients =  Client.city_nombre(@city.nombre)
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)
    @city.nombre = params[:city][:nombre].titleize

    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_url, notice: "La ciudad se ha creado con exito." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to city_url(@city), notice: "La ciudad se ha editado." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_url, status: :see_other, notice: "La ciudad se ha eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:nombre, :Estado_id)
    end
end
