class BroadwayTour < Tour
  attr_reader :id, :name, :link

  def initialize
    id = 3
    name = "Broadway Tour"
    link = navigation_link(broadway_coordinates)
  end

  def broadway_coordinates
    latitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:latitude)
    longitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:longitude)
    coordinates = latitudes.zip(longitudes)
  end
end
