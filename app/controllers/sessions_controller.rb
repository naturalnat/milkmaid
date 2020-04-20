class SessionsController < ApplicationController

  def welcome
      if logged_in?
        @user = User.find(session[:user_id])
        redirect_to user_path(@user)
      end
    end

  def new; end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def create
    if params[:provider] == 'github'
     @user = User.create_by_github_omniauth(auth)
     puts @user
     session[:user_id] = @user.id
     redirect_to user_path(@user)
    else
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
    flash[:error] = 'Please enter correct e-mail address and password.'
      redirect_to login_path
      end
    end
    end

    # def omniauth
    #     @user = User.create_by_github_omniauth(auth)
    #
    #     session[:user_id] = @user.id
    #     redirect_to user_path(@user)
    #   end

private

    def auth
      request.env['omniauth.auth']
    end

end
