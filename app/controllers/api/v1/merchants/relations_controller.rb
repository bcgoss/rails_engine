class Api::V1::Merchants::RelationsController < ApplicationController
  def items
    render json: Merchant.find(params[:id]).items
  end

  def invoices
    render json: Merchant.find(params[:id]).invoices
  end
end
