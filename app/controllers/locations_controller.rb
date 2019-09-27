class LocationsController < ApplicationController

  def index
    if params[:query].present?
      @locations = Location.where("address ILIKE ?", "%#{params[:query]}%").geocoded
    else
      @locations = Location.geocoded
    end





    # @locations = Location.geocoded
    # # @locations = Location.all

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('home-solid.svg')
      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @locations = Location.geocoded.where(id: @location)

    @booking = Booking.new

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('home-solid.svg')
      }
    end
  end
end
