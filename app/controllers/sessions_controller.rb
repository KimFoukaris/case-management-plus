class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    if auth
      @user = User.where(email: auth['info']['email']).first_or_create do |user|
        user.name = auth['info']['name']
        user.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You are now logged in"
    else
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "You are now logged in"
      else
        redirect_to login_path, notice: "You must login with a valid password"
      end
    end
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end
