class ItemsController < ApplicationController
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
  
    def show
      @item = Item.find(params[:id])
    end

  # current_user.idによる条件分岐 未実装
  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :feepayer, :method, :region_id, :category, :days, :price, images: []).merge(user_id: current_user.id)
  end

end
