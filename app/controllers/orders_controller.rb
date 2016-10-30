class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  def new
  end

  def destroy
  end

  def edit
  end

  private

end
