class StateProject < ApplicationRecord
  belongs_to :State
  belongs_to :Project

  def self.estatus(project_id)
    estatusproject = Project.find_by_id(project_id)
    if !estatusproject.nil?
      @state_project = StateProject.where(Project_id: estatusproject.id)
    end
  end
end
