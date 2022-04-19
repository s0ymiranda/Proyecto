class Estado < ApplicationRecord
    has_many :cities
    validates :nombre, presence: true, uniqueness: true 
end
