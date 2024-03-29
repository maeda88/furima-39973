class BuyingController < ApplicationController
  before_action :authenticate_user!
  before_action :check_item_availability

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    @buying_address = BuyingAddress.new
  end

  def create
    @buying_address = BuyingAddress.new(buying_params)
    if @buying_address.valid?
      pay_item
      @buying_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buying_params
    params.require(:buying_address).permit(:postcode, :prefecture_id, :municipality, :street_address, :building_name, :phonenumber).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def check_item_availability
    @item = Item.find_by(id: params[:item_id])
    return unless @item.buying.present?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buying_params[:token],
      currency: 'jpy'
    )
  end
end
