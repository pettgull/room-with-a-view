class LocationsController < ApplicationController
  before_action :set_location, only: [:set_lat_lng, :show]
  def index
    if params[:query].present?
      @locations = Location.where("address ILIKE ?", "%#{params[:query]}%").geocoded
    else
      @locations = Location.geocoded
    end
    set_lat_lng
  end

  def show
    @locations = Location.geocoded.where(id: @location)
    @booking = Booking.new
    set_lat_lng
  end

  private

  def set_lat_lng
    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('home-solid.svg')
      }
    end
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
