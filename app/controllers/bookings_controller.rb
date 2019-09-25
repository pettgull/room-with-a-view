class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    #should display all the bookings for a specific user, not all
    @bookings = Booking.where("user_id = ?", current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(strong_params)
    @booking.user = current_user
    location = Location.find(params[:location_id])
    @booking.location = location
    if @booking.save
      redirect_to booking_path(@booking), notice: 'You requested a new booking'
    else
      render :new
    end
  end

  private

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
