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
      stripe_checkout
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
  def stripe_checkout #MY_CHANGES
    @amount = @cart.total_price
    #This will create a charge with stripe for $10
    #Save this charge in your DB for future reference
    charge = Stripe::Charge.create(
                      :amount => @amount.to_i * 100,
                      :currency => "aud",
                      :source => params[:stripeToken]
                    )
    flash[:notice] = "Successfully created a charge"
  end
end
