class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  def status
    @project = Project.find(params[:id])
    @state_projects = StateProject.estatus(@project.id)
  end

  # GET /projects/new
  def new
    @project = Project.new(State_id: 1, fecha: DateTime.now.strftime('%Y-%m-%dT%H:%M') ) 
    @state_project = StateProject.new(fecha_transicion:  DateTime.now.strftime('%Y-%m-%dT%H:%M'))
  end

  # GET /projects/1/edit
  def edit
   
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @state_project = Project.change_state(@project.State_id,@project.id)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "El proyecto se ha creado con exito." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "El proyecto se ha editado con exito." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "El proyecto se ha eliminado." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:nombre, :codigo, :fecha, :monto, :descripcion, :State_id, :Client_id)
    end
end
