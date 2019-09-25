class LocationsController < ApplicationController

  def index
    # @locations = Location.all
    @locations = Location.geocoded

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
