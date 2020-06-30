class BookingsController < ApplicationController
  def new
    @user = current_user
    @superhero = Superhero.find(params[:superhero_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @superhero = Superhero.find(params[:superhero_id])
    @booking = Booking.new(booking_params)
    @booking.total_price = @superhero.price * (@booking.end_date - @booking.start_date)
    @user.bookings << @booking
    @superhero.bookings << @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
    @bookings.map { |booking| status_past(booking) }
  end

  def search
    @bookings = []
    if !current_user.superheros.empty?
      current_user.superheros.each do |hero|
        @bookings << hero.bookings
      end
    end
    @bookings.flatten!
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  private

  def status_past(booking)
    if booking.end_date <= Date.today
      booking.status = "Past"
    end
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :status)
  end
end
