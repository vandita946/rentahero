class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @booking.review = @review
    if @review.save
      redirect_to superhero_path(@booking.superhero)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit([:content, :rating])
  end
end
