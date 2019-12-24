class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy, :buy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.where(buyer_id: nil)
  end
  
  def new
    @item = Item.new
  end

  def buy
    @items = Item.all
    @item = Item.find(params[:id])
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
    unless current_user.id === @item.seller_id
      redirect_to root_path
    end
  end

  def update
    if current_user.id === @item.seller_id
      if @item.update(item_params)
        redirect_to root_path
      else
        render edit_item_path
      end
    else
      redirect_to root_path
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def destroy
    if current_user.id === @item.seller_id
      if @item.destroy
        attachments = ActiveStorage::Attachment.where(id: params[:deleted_img_ids])
        attachments.map(&:purge)
        redirect_to root_path
      else
        render items_path
      end
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :feepayer, :method, :region_id, :category, :days, :price, :image, images: []).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
