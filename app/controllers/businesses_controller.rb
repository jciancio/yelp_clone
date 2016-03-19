class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def create
    @business = current_user.businesses.build(business_params)

    if @business.save
      redirect_to @business, notice: 'Business added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :description, :address, :city, :state, :zip)
  end

  def authorize
    if current_user.nil?
      redirect_to root_path, alert: "Please register or log in!"
    else
      if @business && @business.user != current_user
        redirect_to root_path, alert: "You can't do that, only the owner (#{@business.user}) can!"
      end
    end
  end
end
