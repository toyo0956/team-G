class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      reirect_to new_items_path
    end
  end 

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :feepayer, :method, :region, :category, :days, :price, :image)
  end
end
