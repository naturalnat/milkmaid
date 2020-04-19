class SessionsController < ApplicationController
  def welcome; end

  def new; end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def create
    if request.env["omniauth.auth"]
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
    @user = User.find_by(username: params[:user][:username])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = 'Please enter correct username and password.'
      redirect_to login_path
      end
    end
    end

    protected

    def auth
      request.env['omniauth.auth']
    end

end
