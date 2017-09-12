class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def logged_in?
    redirect_to root_path if !session[:user_id]
  end
end
