class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :login
    end
  end
end
