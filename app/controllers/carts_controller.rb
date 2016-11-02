class CartsController < ApplicationController
  def index
    @line_items = current_cart.line_items

  end

  def show
    @line_items = current_cart.line_items
  end

  def add_to_cart
    current_cart.add_item(params[:item_id])
    redirect_to items_path
  end

  def cart_processing
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def payment
  end
end
