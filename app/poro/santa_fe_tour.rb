class SantaFeTour < Tour
  attr_reader :id, :name, :link

  def initialize
    @id = 3
    @name = "Santa Fe Art District Tour"
    @link = navigation_link(santafe_coordinates)
  end

  def santafe_coordinates
    search_params = StreetArt.where('latitude >= ? AND latitude <= ? AND longitude <= ? AND longitude >= ?', '39.716465', '39.737118', '-105.002667', '-104.996133')
    latitudes = search_params.pluck(:latitude)
    longitudes = search_params.pluck(:longitude)
    coordinates = latitudes.zip(longitudes)
    arrange_coordinates(coordinates)
  end
end
