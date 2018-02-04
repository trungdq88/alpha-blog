class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = 'Thank you for signing up!'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:message] = 'Your account has been updated!'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
