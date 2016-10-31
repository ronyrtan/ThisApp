class CartsController < ApplicationController
  def index
  end

  def show
    @line_items = current_cart.line_items
  end

  def new
  end

  def destroy
  end

  def edit
  end
end
