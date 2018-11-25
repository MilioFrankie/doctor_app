class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destory]

  def index
    @users = current_user.users
  end

  def show
  end

  def new
    @user. = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user_user
    else
      render :new
    end
  end

  def destory
  @user.destory
  redirect_to users_path
  end

  private
  def set_user
  @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
