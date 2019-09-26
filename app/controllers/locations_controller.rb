class LocationsController < ApplicationController

  def index
<<<<<<< Updated upstream
    @locations = Location.geocoded
    # @locations = Location.all
=======
    # @locations = Location.all
    @locations = Location.geocoded
>>>>>>> Stashed changes

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
