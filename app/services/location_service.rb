class LocationService

  def get_coordinates(destination)
    response = conn.get("geocoding/v1/address") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_address(coordinates)
    response = conn.get("geocoding/v1/reverse") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = coordinates
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
