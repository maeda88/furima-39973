require 'rails_helper'

RSpec.describe BuyingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buying_address = FactoryBot.build(:buying_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buying_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buying_address.building_name = ''
        expect(@buying_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @buying_address.postcode = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buying_address.postcode = '1234567'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buying_address.prefecture_id = 0
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buying_address.municipality = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @buying_address.street_address = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phonenumberが空だと保存できないこと' do
        @buying_address.phonenumber = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberが10桁以下だと保存できないこと' do
        @buying_address.phonenumber = '090123456'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Phonenumber is invalid. Include hyphen(-)")
      end
      it 'phonenumberが11桁以上だと保存できないこと' do
        @buying_address.phonenumber = '090123456891'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Phonenumber is invalid. Include hyphen(-)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buying_address.user_id = nil
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buying_address.item_id = nil
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @buying_address.token = nil
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
