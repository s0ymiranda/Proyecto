class EstadosController < ApplicationController
  before_action :set_estado, only: %i[ show edit update destroy ]

  # GET /estados or /estados.json
  def index
    @estados = Estado.all
  end

  # GET /estados/1 or /estados/1.json
  def show
    @cities =  City.estado_nombre(@estado.nombre)
  end

  # GET /estados/new
  def new
    @estado = Estado.new
  end

  # GET /estados/1/edit
  def edit
  end

  # POST /estados or /estados.json
  def create
    @estado = Estado.new(estado_params)
    @estado.nombre = params[:estado][:nombre].titleize
    
    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_url, notice: "El estado se ha creado con exito" }
        format.json { render :show, status: :created, location: @estado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estados/1 or /estados/1.json
  def update
    respond_to do |format|
      if @estado.update(estado_params)
        format.html { redirect_to estado_url(@estado), notice: "El Estado se ha actualizado con exito." }
        format.json { render :show, status: :ok, location: @estado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1 or /estados/1.json
  def destroy
    @estado = Estado.find(params[:id])
    @estado.destroy
    redirect_to estados_url, status: :see_other, notice: "El Estado se ha eliminado"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_params
      params.require(:estado).permit(:nombre)
    end
end
