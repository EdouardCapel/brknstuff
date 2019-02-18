class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(item_params)

    if @request.save!
      # redirect_to items_path(...)
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    # redirect_to items_path(...)
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :level, :photo)
end
