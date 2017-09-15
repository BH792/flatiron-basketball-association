class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @error = true
      flash.now[:danger] = 'Invalid email/password combination'
      render :login
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
