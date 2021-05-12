class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :cheak_user, only: [:index, :create]

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(order_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def cheak_user
    if current_user.id == @item.user.id || @item.record.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:record_address).permit(:postal_code,
                                           :area_id, :city, :house_number, :building_name,
                                           :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
