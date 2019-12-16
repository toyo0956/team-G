class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
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
  
    def show
    end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :feepayer, :method, :region, :category, :days, :price, images: []).merge(user_id: current_user.id)
  end

  
end
