class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:message] = "Welcome back, #{user.username}!"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:error] = 'Incorrect login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:message] = 'You have logged out!'
    render 'new'
  end
end
