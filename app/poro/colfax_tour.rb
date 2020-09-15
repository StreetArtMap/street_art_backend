class ColfaxTour < Tour
  attr_reader :id, :name, :link

  def initialize
    @id = 1
    @name = "Colfax Tour"
    @link = navigation_link(colfax_coordinates)
  end

  def colfax_coordinates
    latitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:latitude)
    longitudes = StreetArt.where('address ILIKE ?', '%Colfax%').pluck(:longitude)
    coordinates = latitudes.zip(longitudes)
    arrange_coordinates_by_latitude(coordinates)
  end
end
