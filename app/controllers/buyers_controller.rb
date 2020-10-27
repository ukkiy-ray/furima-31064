class BuyersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.id == @item.user_id || @item.buyer.present?
        redirect_to root_path
      end
    elsif user_signed_in? == false && @item.buyer.present?
      redirect_to root_path
    end
  end

end
