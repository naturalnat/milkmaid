class SessionsController < ApplicationController

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new
  end

  def create
    User.find_by(username: params[:user][:username])
  end

end
