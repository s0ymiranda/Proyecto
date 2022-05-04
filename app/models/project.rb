class Project < ApplicationRecord
  belongs_to :State
  belongs_to :Client
  has_many :state_projects

  validates :nombre, presence: true
  validates :codigo, presence: true, uniqueness: true
  validates :monto, presence: true
  validates :descripcion, presence: true

  def self.state_name(state_nombre)
    estado = State.find_by_nombre(state_nombre)
    if !estado.nil?
      @projects = Project.where(state_id: estado.id)      
    end
  end

  def self.change_state(state_id, project_id)
    @state_project = StateProject.create(:State_id => state_id, :Project_id => project_id,
    :fecha_transicion => Time.now)  
  end 
  
end
