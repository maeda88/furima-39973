class BuyingController < ApplicationController
  before_action :authenticate_user!
  before_action :check_item_availability

  def index
    @item = Item.find(params[:item_id])
    @buying_address = BuyingAddress.new
  end

  def create
    @buying_address = BuyingAddress.new(buying_params)
    if @buying_address.valid?
      @buying_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buying_params
    params.require(:buying_address).permit(:postcode, :prefecture_id, :municipality, :street_address, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def check_item_availability
    @item = Item.find_by(id: params[:item_id])
    if @item.buying.present?
      redirect_to root_path
    end
  end
end
