class Api::V1::Items::ItemsController < ApplicationController
  def most
    render json: Item.most_items(params[:quantity])
  end

  def best_day
    render json: Item.find(params[:id]), serializer: ItemBestDaySerializer
  end
end
