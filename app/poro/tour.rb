class Tour

  def navigation_link(coordinates)
    NavigationService.new.get_tour(coordinates)
  end

  def arrange_coordinates_by_latitude(coordinates)
    coordinates.sort do |a, b|
      a[0] <=> b[0]
    end
  end

  def arrange_coordinates_by_longitude(coordinates)
    coordinates.sort do |a, b|
      a[1] <=> b[1]
    end
  end
end
