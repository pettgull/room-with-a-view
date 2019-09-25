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
    raise
    if @booking.save
      raise
      redirect_to bookings_path(@booking), notice: 'You requested a new booking'
    else
      raise
      render :new
    end
  end

  private

  def calculate_price
    rate = params[:rate]
    time = (params[:start_date] - params[:start_date])
    return rate * time
  end

  def set_booking
    @booking = Booking.find(parmas[:id])
  end

  def strong_params
    params.require(:booking).permit(:start_date, :end_date, :location_id)
  end
end
