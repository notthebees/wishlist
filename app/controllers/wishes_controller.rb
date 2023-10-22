class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end
end
