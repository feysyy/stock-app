class Admin::UsersController < ApplicationController
  before_action :check_role

  def index
    @users = User.where.not(role: "admin")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to admin_user_path(user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to admin_users_path
  end

  private

  def check_role
    return if current_user.role == "admin"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :balance, :role, :approved)
  end

end
