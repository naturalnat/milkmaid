# frozen_string_literal: true

class SessionsController < ApplicationController
  def welcome; end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def login; end

  def create
    @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(password: params[:password])
        sessions[:user_id] = @user.id
        redirect_to user_path
             byebug
    else
     flash[:error] = 'Please enter correct username and passowrd.'
       redirect_to login_path
  end
end
end
