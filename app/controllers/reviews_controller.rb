class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create edit update destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
  @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to cloth_path(@booking.cloth), notice: "Thank you for your review."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = @booking.review
    authorize @review
  end

  def update
    @review = @booking.review
    authorize @review
    if @review.update(review_params)
      redirect_to cloth_path(@booking.cloth), notice: "Thank you for your review."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @review = @booking.review
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    raise
    redirect_to cloth_path(@booking.cloth), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comments, :rating)
  end
end
