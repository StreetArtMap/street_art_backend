class NavigationService
  def get_tour(coordinates)
    TourUrl.new(coordinates).create_url
  end
end
