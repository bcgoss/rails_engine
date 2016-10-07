class Api::V1::Items::RevenueController < ApplicationController
  def most
    render json: Item.most_revenue(params[:quantity])
  end
end
