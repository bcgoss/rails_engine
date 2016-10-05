class Api::V1::InvoiceItems::SearchController < ApplicationController
  def find
    render json: InvoiceItem.find_by(invoice_items_params)
  end

  def find_all
    render json: InvoiceItem.where(invoice_items_params)
  end

  def random
    render json: InvoiceItem.random
  end

private
  def invoice_items_params
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :item_id, :invoice_id)
  end
end
