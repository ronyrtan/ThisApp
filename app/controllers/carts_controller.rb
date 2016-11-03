class CartsController < ApplicationController
  def index
    @line_items = @cart.line_items

  end

  def show
    @line_items = @cart.line_items
  end

  def add_to_cart
    current_cart.add_item(params[:item_id])
    redirect_to items_path
  end

  def cart_processing
    @line_items = @cart.line_items

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
