class Profile::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    #should display all the bookings for a specific user, not all
    @bookings = Bookings.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(strong_params)
    @booking.user = current_user
    @booking.location = params[:location_id]
    @booking.total_price = calculate_price(@booking.location, @booking)
    if @booking.start_date < Date.today || @booking.start_date > @booking.end_date
      flash[:notice] = "That isn't possible"

    elsif location.available?(@booking.start_date, @booking.end_date)
      @booking.save
    else
      flash[:notice] = "Sorry, the location is already booked."
      render :new_booking
    end
    if @booking.save
      redirect_to booking_path(@booking), notice: 'You requested a new booking'
    else
      render :new_booking
    end
    if @booking.save
      redirect_to bookings_path(@booking), notice: 'You requested a new booking'
    end
  end

  private

  def calculate_price(location, booking)
    time = (booking.end_date - booking.start_date)/3600
    return location.hourly_rate * time
  end

  def set_booking
    @booking = Booking.find(parmas[:id])
  end

  def strong_params
    params.require(:booking).permit(:start_date, :end_date, :location_id)
  end
end
