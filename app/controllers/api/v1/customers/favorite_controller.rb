class Api::V1::Customers::FavoriteController < ApplicationController
  def merchant
    render json: Customer.find(params[:id]).favorite_merchant
  end
end
