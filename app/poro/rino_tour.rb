class RinoTour < Tour
  attr_reader :id, :name, :link

  def initialize
    @id = 2
    @name = "RiNo Tour"
    @link = navigation_link(rino_coordinates)
  end

  def rino_coordinates
    search_params = StreetArt.where('latitude >= ? AND latitude <= ? AND longitude <= ? AND longitude >= ?', '39.758000', '39.765150', '-104.986480', '-104.978620' )
    latitudes = search_params.pluck(:latitude)
    longitudes = search_params.pluck(:longitude)
    coordinates = latitudes.zip(longitudes)
    # coordinates.shuffle.first(23)
  end
end
