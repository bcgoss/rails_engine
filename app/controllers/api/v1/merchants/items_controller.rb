class Api::V1::Merchants::ItemsController < ApplicationController
  def most
    render json: Merchant.most_items(params[:quantity])
  end
end
