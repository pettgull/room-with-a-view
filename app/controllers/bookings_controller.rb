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
  end

  # def is_available
  #   where = "location = ? AND bookings.start_date <= ? AND bookings.end_date >= ?"
  #   Location.joins(:bookings).where(where, params[end_date], params[start_date]).any?
  # end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(strong_params)
    @booking.user = current_user
    location = Location.find(params[:location_id])
    @booking.location = location

    if @booking.start_date < Date.today
      flash[:notice] = "That isn't possible"
      render :index
    # elsif location.available?
    #   @booking.save
    else
      flash[:notice] = "Sorry, the location is already booked."
      render :index
    end

    if @booking.save
      redirect_to booking_path(@booking), notice: 'You requested a new booking'
    else
      render :new
    end
  end

  def edit
    raise
  end

  def update
    # @booking.accepted = params[:booking]
    @booking.accepted = true
    @booking.save
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
