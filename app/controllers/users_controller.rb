class UsersController < ApplicationController
  before_action :set_user
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def new
  end

  def update
  end
  
  def destroy
  end

  private 

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :asset)
  end
end