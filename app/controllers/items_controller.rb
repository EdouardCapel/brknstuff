class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save!
      # redirect_to items_path(...)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    # redirect_to items_path(...)
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :level, :photo)
end
