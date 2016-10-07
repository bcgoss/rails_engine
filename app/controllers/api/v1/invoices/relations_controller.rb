class Api::V1::Invoices::RelationsController < ApplicationController
  def transactions
    render json: Invoice.find(params[:id]).transactions
  end
  def invoice_items
    render json: Invoice.find(params[:id]).invoice_items
  end
  def items
    render json: Invoice.find(params[:id]).items
  end
  def customer
    render json: Invoice.find(params[:id]).customer
  end
  def merchant
    render json: Invoice.find(params[:id]).merchant
  end
end
