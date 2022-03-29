class Client < ApplicationRecord
  belongs_to :City
  has_many :projects
end
