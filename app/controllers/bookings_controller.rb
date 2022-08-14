class BookingsController < ApplicationController
  before_action :set_cloth, only: %i[new create edit update]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    set_booking
    authorize @booking
    if @booking.save
      redirect_to bookings_path, notice: "Rent request was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find_by(cloth_id: params[:cloth_id])
    authorize @booking
  end

  def update
    @booking = Booking.find_by(cloth_id: params[:cloth_id])
    authorize @booking
    @booking.update(booking_params)
    set_booking
    if @booking.save
      redirect_to bookings_path, notice: "Rent request was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other, notice: "Rent request was successfully deleted."
  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:cloth_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking.cloth_id = @cloth.id
    @booking.renter = @cloth.user
    @booking.rentee = current_user
    @booking.rent_duration = @booking.end_date - @booking.start_date
    @booking.total_cost = @cloth.price * @booking.rent_duration
  end
end
