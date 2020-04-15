# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  def logged_in?
    !!session[:user_id]
end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to login_path unless logged_in?
  end
end
