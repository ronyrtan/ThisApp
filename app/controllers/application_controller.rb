class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user
  before_action :current_cart
  before_action :fetch_wishlist

  private
  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by :id => session[:user_id]
    end
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_user
    redirect_to root_path unless @current_user.present?
  end

  def check_for_admin
    redirect_to root_path unless (@current_user.present? && @current_user.admin?)
  end

  def current_cart
    if @current_user.present?
      @cart = Cart.find_by(id: session[:cart_id], user_id: @current_user.id)
      if @cart.present?
        @cart
      else
        @cart = Cart.new
        @cart.user_id = @current_user.id
        if @cart.save
          session[:cart_id] = @cart.id
        end
      end
      @cart
    end
  end

  def fetch_wishlist
    if @current_user.present? && @current_user.wishlist.present?
      @wishlist = Wishlist.find_by(id: @current_user.wishlist.id, user_id: @current_user.id)
      if @wishlist.present?
        @wishlist
      else
        @wishlist = Wishlist.new
        @wishlist.user_id = @current_user.id
        @wishlist.save
      end
      @wishlist
    elsif @current_user.present?
      @wishlist = Wishlist.new
      @wishlist.user_id = @current_user.id
      @wishlist.save
      @wishlist
    end
  end

end
