# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = 'Please enter correct e-mail address and password.'
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    redirect_to '/' unless @user
  end

  def index
    @most_reviewed = Review.most_reviews
    puts @most_reviewed
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
