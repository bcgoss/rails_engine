class Api::V1::Merchants::SearchController < ApplicationController
  def find
    render json: Merchant.find_by(merchant_params)
  end

  def find_all
    render json: Merchant.where(merchant_params)
  end

  def random
    render json: Merchant.random
  end
private
  def merchant_params
    params.permit(:id, :name)
  end
end
