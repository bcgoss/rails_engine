class Api::V1::Items::SearchController < ApplicationController
  def find
    render json: Item.order(:id).find_by(item_params)
  end

  def find_all
    render json: Item.where(item_params)
  end

  def random
    render json: Item.random
  end
private
  def item_params
    if params.keys.include?("unit_price")
      params["unit_price"] = params["unit_price"].gsub(".", "")
    end
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  end
end
