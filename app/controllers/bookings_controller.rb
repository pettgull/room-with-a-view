class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    # should display all the bookings for a specific user, not all
    @bookings = Booking.where("user_id = ?", current_user)
    locations = Location.where(:user_id => current_user)
    @loction_bookings = Booking.where(:location_id => locations)
    @booking = Booking.new
  end

  def show
    set_lat_lng
  end

  # def is_available
  #   where = "location = ? AND bookings.start_date <= ? AND bookings.end_date >= ?"
  #   Location.joins(:bookings).where(where, params[end_date], params[start_date]).any?
  # end

  def new
    @booking = Booking.new
  end

  def create

    # @booking.end_date = @booking.end_date.change(:min => 0)
    @booking = Booking.new(strong_params)
    @booking.user = current_user
    location = Location.find(params[:location_id])
    @booking.location = location
    @booking.start_date = @booking.start_date.change(:min => 0)
    if @booking.start_date < Date.today
      flash[:notice] = "That isn't possible"
      render :new
    # elsif location.available?
    #   @booking.save
    # else
    #   flash[:notice] = "Sorry, the location is already booked."
    #   render :new
    end
    if @booking.save
      redirect_to booking_path(@booking), notice: 'You requested a new booking'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @booking.accepted = params[:booking]
    @booking.accepted = true
    @booking.save
  end

  private

  def set_lat_lng
    @locations = []
    @locations << @booking.location
    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        image_url: helpers.asset_url('home-solid.svg')
      }
    end
  end

  def calculate_price(rate, start_date, end_date)
    time = end_date - start_date
    return rate * time
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
