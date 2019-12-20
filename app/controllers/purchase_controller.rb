class PurchaseController < ApplicationController
  before_action :set_card, :set_item

  def show
    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
    )
    redirect_to root_path, notice: "#{@item.name}を購入しました。"
  end

private
  def set_card
    @card = Card.find_by(user_id: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
