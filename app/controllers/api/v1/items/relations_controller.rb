class Api::V1::Items::RelationsController < ApplicationController
  def invoice_items
    render json: Item.find(params[:id]).invoice_items
  end

  def merchant
    render json: Item.find(params[:id]).merchant
  end
end
