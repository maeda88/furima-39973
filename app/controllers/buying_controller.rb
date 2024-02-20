class BuyingController < ApplicationController
  before_action :authenticate_user!
  before_action :check_item_availability

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @buying_address = BuyingAddress.new
  end

  def create
    @buying_address = BuyingAddress.new(buying_params)
    if @buying_address.valid?
      pay_item
      @buying_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buying_params
    params.require(:buying_address).permit(:price, :postcode, :prefecture_id, :municipality, :street_address, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def check_item_availability
    @item = Item.find_by(id: params[:item_id])
    if @item.buying.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: buying_params[:price],  # 商品の値段
        card: buying_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
