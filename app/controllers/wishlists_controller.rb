class WishlistsController < ApplicationController
  def show
    @wishlist = @current_user.wishlist
  end

  def add_to_wishlist
    item = Item.find params[:item_id]
    type = params[:type]
    if type == "wish"
      @current_user.add_to_wishlist item
      redirect_to :back
    elsif type == "unwish"
      # raise '#{item} DELETE'
      @current_user.wishlist.items.delete(item)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def create
  end

  def destroy
  end
end
