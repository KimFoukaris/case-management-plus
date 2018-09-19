class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, only: [:index, :show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: 'User was successfully created'
      else
        render :new
      end
    end

    def show
      @message = params[:message] if params[:message]
      @message ||= false
    end

  def edit
  end

  def update
    if @user.id == session[:user_id]
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'User was successfully updated'
      else
        render 'edit'
      end
    else
      redirect_to edit_user_path, notice: 'You can only edit your own user profile'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
        params.require(:user).permit(
          :name,
          :title,
          :email,
          :password,
          :password_confirmation,
          :admin
        )
      end
end
