class ReviewsController < ApplicationController

  def index
    return head(:forbidden) unless is_admin?
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
        @review.save
        redirect_to @review
    else
        render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    return head(:forbidden) unless has_access(@review.user_id)
  end

  def update
    @review = Review.find_by(id: params[:id]) #this is an object
    @review.update(review_params)
    redirect_to @review
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    return head(:forbidden) unless has_access(@review.user_id)
    @review.destroy
    redirect_to @review
  end

  private

  def review_params
    params.require(:review).permit(:booking_id, :user_id, :description, :star_rating)
  end
end
