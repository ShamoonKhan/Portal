class UsersController < ApplicationController
  before_action :authenticate_user!
  include Users
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    return unless @user.update(user_params)

    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :lname, :email, :cnic_no, :avatar, :contact, :address, course_ids: [])
  end
end
