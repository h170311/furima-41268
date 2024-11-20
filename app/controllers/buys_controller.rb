class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = 'sk_test_ac3ab4a683ab6a9fd8d6ed99'
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: set_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:order).permit(:postcode, :prefecture_id, :municipalities, :street_address,
                                  :telephone, :building_name).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
