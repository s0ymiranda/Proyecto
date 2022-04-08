class Client < ApplicationRecord
  belongs_to :City
  has_many :projects

  def self.city_nombre(city_nombre)
    city = City.find_by_nombre(city_nombre)
    if !city.nil?
      @client = Client.where(city_id: city.id)
    end
  end
end
