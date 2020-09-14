class ToursController < ApplicationController
  def index
    render json: TourSerializer.new([ColfaxTour.new, RinoTour.new, SantaFeTour.new]).info
  end
end
