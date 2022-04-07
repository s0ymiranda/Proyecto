class State < ApplicationRecord
    has_many :projects
    has_many :state_projects
    
end
