class WishlistsController < ApplicationController
  def show
    @wishlist = @current_user.wishlist
  end

  def add_to_wishlist
    item = Item.find params[:item_id]
    @current_user.add_to_wishlist item
    redirect_to items_path
  end

  def create
  end

  def destroy
  end
end
