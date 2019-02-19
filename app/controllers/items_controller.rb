class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

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
    @item.user = current_user
    if @item.save!
      redirect_to item_path(@item)
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
