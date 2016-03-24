class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_business, only: [:new, :show, :create, :update, :destroy]

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.business = @business

    if @review.save
      redirect_to @business, notice: 'Review created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @business, notice: 'Review updated!'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @business, notice: 'Review deleted!'
  end

  private
  def review_params
    params.require(:review).permit(:title, :description)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_business
    @business = Business.find(params[:business_id])
  end
end
