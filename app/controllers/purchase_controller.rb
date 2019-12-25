class PurchaseController < ApplicationController
  before_action :set_card, :set_item

  def show
    if current_user.id === @item.seller_id 
      redirect_to root_path
    end
    unless @item.buyer_id === nil
      redirect_to root_path
    end
    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def pay
    if current_user.id === @item.seller_id || @item.buyer_id != nil
      redirect_to root_path
    else
      Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
      Payjp::Charge.create(
        :amount => @item.price,
        :customer => @card.customer_id,
        :currency => 'jpy',
      )
      item = Item.find(params[:id])
      item.update_attributes(buyer_id: current_user.id)

      redirect_to root_path, notice: "#{@item.name}を購入しました。"
    end
  end

private
  def set_card
    @card = Card.find_by(user_id: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
