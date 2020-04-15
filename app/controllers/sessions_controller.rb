# frozen_string_literal: true

class SessionsController < ApplicationController
  def welcome; end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def login; end

  def create
    User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(password: params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
      flash[:error] = 'Please enter correct username and passowrd.'
      redirect_to login_path
  end
end
end
