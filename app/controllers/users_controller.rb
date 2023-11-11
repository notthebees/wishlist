class UsersController < ApplicationController
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
    @friend = User.find(params[:friend_id])

    @user.friends << @friend

    if @user.save
      redirect_to @user, notice: 'Friend added successfully.'
    else
      redirect_to @user, alert: 'Failed to add friend.'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
