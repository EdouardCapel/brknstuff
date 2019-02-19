class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @request = Request.new
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    @request = Request.new(request_params)
    @request.item = @item
    @request.user = current_user

    if @request.save!
      redirect_to items_requests_path
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

def request_params
  params.require(:request).permit(:user, :item, :status)
end
