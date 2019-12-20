class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card

  def show
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_TEST_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def pay
    @item = Item.find(params[:id])
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
    @card = Card.where(user_id: current_user).first
  end
end
