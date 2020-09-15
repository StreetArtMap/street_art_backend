class Tour

  def navigation_link(coordinates)
    NavigationService.new.get_tour(coordinates)
  end

  def arrange_coordinates(coordinates)
    coordinates.sort do |lat, lon|
      lat[1] <=>  lon[1]
    end
  end
end
