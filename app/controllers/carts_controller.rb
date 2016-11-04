class CartsController < ApplicationController
  def index
    @line_items = @cart.line_items

  end

  def show
    @line_items = @cart.line_items
  end

  def add_to_cart
    @cart.add_item(params[:item_id], params[:qty])
    @line_items_quantity = @cart.line_items.pluck('quantity').inject{|sum, n| sum + n }
    
    respond_to do |format|
      format.js
    end
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
