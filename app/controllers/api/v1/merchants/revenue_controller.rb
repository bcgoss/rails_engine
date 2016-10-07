class Api::V1::Merchants::RevenueController < ApplicationController
  def single
    render json: Merchant.find(params[:id]).revenue(params[:date]), serializer: MerchantRevenueSerializer
  end

  def all
    render json: Merchant.revenue(params[:date]), serializer: MerchantRevenueSerializer
  end

end
