class RinoTour < Tour
  attr_reader :id, :name, :link

  def initialize
    id = 2
    name = "RiNo Tour"
    link = navigation_link(rino_coordinates)
  end

  def rino_coordinates
    latitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:latitude)
    longitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:longitude)
    coordinates = latitudes.zip(longitudes)
  end
end
