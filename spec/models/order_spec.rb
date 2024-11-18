require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order, user_id: user.id)
  end
  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @order.street_address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order.telephone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下は保存できないこと' do
        @order.telephone = 123_456_789
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid. Input half-width characters.')
      end
      it 'telephoneが12桁以上は保存できないこと' do
        @order.telephone = 123_456_789_876
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid. Input half-width characters.')
      end
      it 'telephoneが全角数値だと保存できないこと' do
        @order.telephone = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid. Input half-width characters.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
