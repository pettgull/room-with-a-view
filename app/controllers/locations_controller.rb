class LocationsController < ApplicationController

  def index
    @locations = Location.geocoded
    # @locations = Location.all

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
  end
end
