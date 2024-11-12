class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buy = OrderForm.new
  end

  def create
    @buy = OrderForm.new(set_params)
    return unless @buy.valid?

    @buy.save
    redirect_to root_path
  end

  private

  def set_params
    params.permit(:item_id, :number, :expiry, :cvc, :postcode, :prefecture_id, :municipalities, :street_address,
                  :telephone, :building_name).merge(user_id: current_user.id)
  end
end
