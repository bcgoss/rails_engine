class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def total
    render json: Merchant.find(params[:id]), serializer: MerchantCustomersWithPendingInvoicesSerializer 
  end

end
