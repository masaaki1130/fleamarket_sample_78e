class PurchaseController < ApplicationController
  require 'payjp'

  before_action :set_item
  before_action :set_card
  before_action :set_destination, except: [:index, :new, :create, :show]

  def index
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    else
      redirect_to controller: "card", action: "new"
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
    @product.update(buyer_id: @product.buyer_id = current_user.id)
    redirect_to action: 'done'
  end

  def done
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  private

  def set_item
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_destination
    @destination = Address.find(current_user.id)
  end
end
