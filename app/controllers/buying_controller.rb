class BuyingController < ApplicationController
  before_action :authenticate_user!
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
end
