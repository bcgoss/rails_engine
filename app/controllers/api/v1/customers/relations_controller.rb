class Api::V1::Customers::RelationsController < ApplicationController
  def invoices
    render json: Customer.find(params[:id]).invoices
  end

  def transactions
    render json: Customer.find(params[:id]).transactions
  end
end
