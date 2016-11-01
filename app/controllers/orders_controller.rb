class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  def create

    puts params

    @order = Order.new
    @order.user_id = @current_user.id
    @order.line_items = @cart.line_items
    @order.stripe_token = params[:stripeToken]
    if @order.save
      redirect_to order_complete_path
      @cart.destroy
      # @cart = Cart.new
    end
  end

  def order_complete
  end

  def destroy
  end

  def edit
  end

  private
end
