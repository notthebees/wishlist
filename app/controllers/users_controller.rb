class UsersController < ApplicationController
  before_action :require_user
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def add_friend
    @user = User.find(params[:id])

    unless @user == current_user
      head :unauthorized
      return
    end

    @friend = User.find(params[:friend_id])

    @user.friends << @friend
    @friend.friends << @user

    redirect_to @user, notice: 'Friend added successfully.'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
