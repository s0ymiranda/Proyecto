class Project < ApplicationRecord
  belongs_to :State
  belongs_to :Client
  has_many :state_projects
end
