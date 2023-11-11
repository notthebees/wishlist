class WishesController < ApplicationController
  before_action :require_user
  before_action :set_user
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  def index
    @wishes = @user.wishes
  end

  def show
  end

  def new
    @wish = @user.wishes.build
  end

  def create
    @wish = @user.wishes.build(wish_params)

    if @wish.save
      redirect_to user_wish_path(@user, @wish)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @wish.update(wish_params)
      redirect_to user_wish_path(@user, @wish)
    else
      render :edit
    end
  end

  def destroy
    @wish.destroy
    redirect_to user_wishes_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_wish
    @wish = @user.wishes.find(params[:id])
  end

  def wish_params
    params.require(:wish).permit(:title, :body)
  end
end
