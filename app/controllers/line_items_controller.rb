class LineItemsController < ApplicationController
  def index
  end

  def show
    @line_item = LineItem.find_by(:item_id => params[:id])
  end

  def update
    cart = current_cart
    @line_item = cart.line_items.find(params[:id])
    @line_item.update_attributes(line_items_params)
    @line_items = cart.line_items
  end

  def destroy
    @cart = current_cart
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    @line_items = @cart.line_items
  end

  def edit
  end

  private
    def line_items_params
      params.require(:line_item).permit(:quantity, :item_id)
    end
end
