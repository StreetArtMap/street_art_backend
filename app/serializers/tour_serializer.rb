class TourSerializer
  def initialize(tours)
    @tours = tours
  end

  def info
    {
      "data": {
        "allTours":
          @tours
      }
    }
  end
end
