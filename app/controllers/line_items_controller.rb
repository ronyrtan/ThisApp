class LineItemsController < ApplicationController
  def index
  end

  def show
    @line_item = LineItem.find_by(:item_id => params[:id])
    LineItem.increment_quantity(@line_item.quantity)

  end

  def new
  end

  def create
    @cart = current_cart
    item = Item.find(params[:id])
    @line_item = @cart.line_items.build(:item => item)


    if @line_item.save
      redirect_to(@line_item.cart, :notice => 'Line item was succesfully created.')
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end
end
