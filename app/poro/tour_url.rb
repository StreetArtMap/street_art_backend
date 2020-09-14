class TourUrl
  attr_reader :coordinates, :origin, :center

  def initialize(coordinates)
    @coordinates = coordinates
    @origin = coordinates.first.join(',')
    @center = find_center
    @url_a = "https://www.google.com/maps/dir/"
    @url_b = "17z/data=!3m1!4b1!4m18!4m17"
    @url_c = "!3e2?hl=en&authuser=0"
  end

  def create_url
    @url_a + formatted_coords + @center + @url_b + destinations + @url_c
  end

  private

  def find_center
    center = Hash.new { |h, k| h[k] = [] }
    @coordinates.each do |set|
      center[:lat] << set[0]
      center[:lon] << set[1]
    end
    avg_coord(center)
  end

  def avg_coord(center)
    floats = center.map do |_k, v|
      (v.min.to_f + v.max.to_f) / 2
    end
    '@' + floats.join(',') + ','
  end

  def formatted_coords
    @coordinates.map do |set|
      "'" + set.join(',') + "'/"
    end.join
  end

  def destinations
    @coordinates.map do |set|
      '!1m3!2m2!1d' + set.reverse.join('!2d')
    end.join
  end
end
