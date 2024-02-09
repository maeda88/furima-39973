class BuyingController < ApplicationController
  before_action :authenticate_user!
  def index
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
    params.require(:buying_address).permit(:item_id, :buying_id, :postcode, :prefecture, :municipality, :street_address, :building_name, :phonenumber).merge(user_id: current_user.id)
  end
end
