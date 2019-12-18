class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

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
  end

  def destroy
    if @item.destroy
      attachments = ActiveStorage::Attachment.where(id: params[:deleted_img_ids])
      attachments.map(&:purge)
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
