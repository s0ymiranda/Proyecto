class Client < ApplicationRecord
  belongs_to :City
  has_many :projects

  def self.city_nombre(city_nombre)
    city = City.find_by_nombre(city_nombre)
    if !city.nil?
      @client = Client.where(city_id: city.id)
    end
  end

#Mostrar El proyecto que pueda tener el cliente, verificando con su ID 
  def self.proyecto_nombre(proyecto_nombre)
    proyecto = Project.where(Client_id: proyecto_nombre)
  end  

end
