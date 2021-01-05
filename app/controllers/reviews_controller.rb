class ReviewsController < ApplicationController

    def index
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

    private
     
    def review_params
        params.require(:review).permit(:booking_id, :user_id, :description, :star_rating)
    end 
end
