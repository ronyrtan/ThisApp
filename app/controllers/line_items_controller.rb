class LineItemsController < ApplicationController
  def index
  end

  def show
    @line_item = LineItem.find_by(:item_id => params[:id])
  end

  def new
  end

  def create
    @cart = current_cart
    item = Item.find(params[:id])
    @line_item = @cart.line_items.build(:item => item)

    raise 'how does it get here??'

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
