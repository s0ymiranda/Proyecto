class Project < ApplicationRecord
  belongs_to :State
  belongs_to :Client
  has_many :state_projects

  def self.state_name(state_nombre)
    estado = State.find_by_nombre(state_nombre)
    if !estado.nil?
      @projects = Project.where(state_id: estado.id)      
    end
  end

  def self.numeros(state_nombre)
    estado = State.find_by_nombre(state_nombre)
    @i = 0
    if !estado.nil?  
      @projects = Project.where(state_id: estado.id)
      @i += 1
    end
   
  end
end
