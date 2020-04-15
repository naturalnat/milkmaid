
class SessionsController < ApplicationController
  def welcome; end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new; end

  def create
    @user = User.find_by(username: params[:user][:username])
      if @user&.authenticate(password: params[:user][:password])
        sessions[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = 'Please enter correct username and password.'
        redirect_to login_path
      end
    end
end
