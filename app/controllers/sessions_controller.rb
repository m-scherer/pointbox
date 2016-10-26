class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash[:danger] = "Email does not exist"
      render :new
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Password does not match email"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end

end
