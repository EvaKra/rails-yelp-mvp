class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # find the restaurant that we want to add the review to
    @review = Review.new(review_params)
    # create new review using strong params
    @review.restaurant = @restaurant
    # link the review to a restaurant, connect the foreign keys
    if @review.save
      # if true (it passes validations) it will go to redirect
      redirect_to restaurant_path(@restaurant)
    else
      # if false (it does not pass validations)
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
