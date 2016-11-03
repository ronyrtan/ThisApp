class WishlistsController < ApplicationController
  def show
    @wishlist = @current_user.wishlist
  end

  def add_to_wishlist
    @item = Item.find params[:item_id]
    type = params[:type]

    respond_to do |format|
      if type == 'wish'
        @current_user.add_to_wishlist @item
        format.js
      else
        @current_user.wishlist.items.delete(@item)
        format.js
      end
    end
  end

  def create
  end

  def destroy
    @item = Item.find params[:id]
    respond_to do |format|
      @current_user.wishlist.items.delete(@item)
      format.js
    end

  end
end
