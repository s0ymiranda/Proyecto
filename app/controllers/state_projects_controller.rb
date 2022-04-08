class StateProjectsController < ApplicationController
  before_action :set_state_project, only: %i[ show edit update destroy ]

  # GET /state_projects or /state_projects.json
  def index
    @state_projects = StateProject.all
  end

  # GET /state_projects/1 or /state_projects/1.json
  def show
  end

  # GET /state_projects/new
  def new
    @state_project = StateProject.new(fecha_transicion:  DateTime.now.strftime('%Y-%m-%dT%H:%M')) 
  end

  # GET /state_projects/1/edit
  def edit
  end

  # POST /state_projects or /state_projects.json
  def create
    @state_project = StateProject.new(state_project_params)

    respond_to do |format|
      if @state_project.save
        format.html { redirect_to state_project_url(@state_project), notice: "State project was successfully created." }
        format.json { render :show, status: :created, location: @state_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_projects/1 or /state_projects/1.json
  def update
    respond_to do |format|
      if @state_project.update(state_project_params)
        format.html { redirect_to state_project_url(@state_project), notice: "State project was successfully updated." }
        format.json { render :show, status: :ok, location: @state_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_projects/1 or /state_projects/1.json
  def destroy
    @state_project.destroy

    respond_to do |format|
      format.html { redirect_to state_projects_url, notice: "State project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_project
      @state_project = StateProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_project_params
      params.require(:state_project).permit(:fecha_transicion, :State_id, :Project_id)
    end
end
