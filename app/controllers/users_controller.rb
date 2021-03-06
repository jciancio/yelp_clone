class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    # Taking account for user who tries to register when already logged in
    if !current_user
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user, notice: 'User Created!'
      else
        render :new
      end
    else
      redirect_to user_path(current_user), notice: 'You already have an account!'
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to @user, notice: 'User updated!'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Your account has been deleted."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end
end
