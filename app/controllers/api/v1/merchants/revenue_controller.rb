class Api::V1::Merchants::RevenueController < ApplicationController
  def total
    # merchant = Merchant.find(params[:id])
    # revenue = merchant.invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
    render json: Merchant.find(params[:id]), serializer: MerchantRevenueSerializer
    # render json: {revenue: revenue}
  end

end
