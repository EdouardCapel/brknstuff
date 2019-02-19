class RequestsController < ApplicationController

  def index
    @owner_items = current_user.items
    @user_requests = Request.where(user: current_user)
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
    @request = Request.new
    @request.status = '0'
    @request.item = @item
    @request.user = current_user

    if @request.save!
      redirect_to requests_path
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
  params.require(:request).permit(:status)
end
