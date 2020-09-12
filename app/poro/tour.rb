class Tour

  def navigation_link(coordinates)
    NavigationService.new.get_tour(coordinates)
  end
end
