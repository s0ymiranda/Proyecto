class City < ApplicationRecord
  belongs_to :Estado
  has_many :clients
end
