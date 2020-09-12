class ToursController < ApplicationController
  def index
    render json: TourSerializer.new([ColfaxTour.new, RinoTour.new, BroadwayTour.new]).info
  end
end
