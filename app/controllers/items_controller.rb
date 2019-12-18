class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :show, :destroy]


  def index
    @items = Item.all
  end
  
  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end 
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render edit_item_path
    end
  end
  
  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render items_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :feepayer, :method, :region_id, :category, :days, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
