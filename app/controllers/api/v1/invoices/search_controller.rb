class Api::V1::Invoices::SearchController < ApplicationController
  def find
   render json: Invoice.find_by(invoice_params)
  end

  def find_all
    render json: Invoice.where(invoice_params)
  end

private
  def invoice_params
    params.permit(:id, :status)
  end
end
