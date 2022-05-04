class City < ApplicationRecord
  belongs_to :Estado
  has_many :clients

  

  validates :nombre, presence: true, uniqueness: true
  def self.estado_nombre(estado_nombre)
    estado = Estado.find_by_nombre(estado_nombre)
    if !estado.nil?
      @cities = City.where(estado_id: estado.id)
    end
  end

  

end
