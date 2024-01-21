require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての項目が入力してあれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '画像が空で出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空で出品できない' do
        @item.trade_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Trade name can't be blank")
      end
      it '商品の説明が空で出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空で出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が空で出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空で出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it ' 発送元の地域の情報が空で出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が空で出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格の情報が空で出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300~¥9,999,999の間以外で出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字 ¥300~¥9,999,999の範囲で入力してください')
      end
      it '価格が全角数字で出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字 ¥300~¥9,999,999の範囲で入力してください')
      end
    end
  end
end
