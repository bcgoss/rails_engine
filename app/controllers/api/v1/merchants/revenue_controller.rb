class Api::V1::Merchants::RevenueController < ApplicationController
  def total
    render json: Merchant.find(params[:id]), serializer: MerchantRevenueSerializer
  end

end
