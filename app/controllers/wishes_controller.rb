class WishesController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    @wishes = Wish.all
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)

    if @wish.save
      redirect_to @wish
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])

    if @wish.update(wish_params)
      redirect_to @wish
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def wish_params
    params.require(:wish).permit(:title, :body)
  end
end
