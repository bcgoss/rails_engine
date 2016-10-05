class Api::V1::Items::SearchController < ApplicationController
  def find
    render json: Item.find_by(item_params)
  end

  def find_all
    render json: Item.where(item_params)
  end

  def random
    render json: Item.random
  end
private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  end
end
