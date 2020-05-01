class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if @milk = Milk.find_by_id(params[:milk_id])
       @review = @milk.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:error] = 'Error, please fill in all fields and try again.'
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
    @milk = Milk.find_by_id(@review.milk_id)
  end

  def index
    @reviews = Review.all
    @most_reviewed = User.most_reviews.first
    @most_reviewed = UsersHelper.getusername(@most_reviewed.id)
  end

  private

  def review_params
    params.require(:review).permit(:milk_id, :content, :stars, :title)
  end
end
