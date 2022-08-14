class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = params[:booking_id]
    authorize @review
    if @review.save
      redirect_to @review, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @review
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comments, :rating)
  end
end
