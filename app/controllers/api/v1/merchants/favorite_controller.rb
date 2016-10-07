class Api::V1::Merchants::FavoriteController < ApplicationController
  def customer
    render json: Merchant.find(params[:id]).favorite_customer
  end

end
