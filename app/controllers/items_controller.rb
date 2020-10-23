class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if user_signed_in? && current_user.id == @item.user_id
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :item_details, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_period_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    if user_signed_in?
      unless current_user.id == @item.user_id
        redirect_to action: :index
      end
    end
  end
end
