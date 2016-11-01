class ItemsController < ApplicationController
  def index
    @items = Item.all

    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    elsif params[:type].present?
      @items = Item.where(:type_id => @type_id).order("created_at DESC")
    else
      @items = Item.all.order("created_at DESC")
    end

    if params[:category]
      @items = Item.where(:category => params[:category])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find params[:id]
  end

  def show_category
    @items = Item.find_by_category(params[:category])
  end

  def new33
    @item = Item.new
  end

  def create
    @item = Item.new items_params
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    redirect_to items_path
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :description, :colour, :size, :brand, :category, :image)
  end
end
