class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def list
    render json: Merchant.find(params[:id]).pending_invoice_customers
  end
end
