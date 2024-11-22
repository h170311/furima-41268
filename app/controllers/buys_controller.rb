class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item,      only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :current_user_index, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def current_user_index
    redirect_to root_path if current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path unless @item.buy.nil?
  end

  def set_params
    params.require(:order).permit(:postcode, :prefecture_id, :municipalities, :street_address,
                                  :telephone, :building_name).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: set_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
