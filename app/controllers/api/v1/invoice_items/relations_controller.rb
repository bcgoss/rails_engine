class Api::V1::InvoiceItems::RelationsController < ApplicationController
  def invoice
    render json: InvoiceItem.find(params[:id]).invoice
  end

  def item
    render json: InvoiceItem.find(params[:id]).item
  end
end
