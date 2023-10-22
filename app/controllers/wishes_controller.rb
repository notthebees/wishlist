class WishesController < ApplicationController
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

  private
  def wish_params
    params.require(:wish).permit(:title, :body)
  end
end
