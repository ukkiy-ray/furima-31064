class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :item_details, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :days_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
