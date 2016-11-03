class CartsController < ApplicationController
  def index
    @line_items = @cart.line_items

  end

  def show
    @line_items = @cart.line_items
  end

  def add_to_cart
    @cart.add_item(params[:item_id], params[:qty])
    line_items = @cart.line_items.pluck('quantity').inject{|sum, n| sum + n }

    respond_to do |format|
      format.html { redirect_to items_path }
      format.json { render :json => {total_price:  @cart.total_price, total_qty: line_items} }
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
