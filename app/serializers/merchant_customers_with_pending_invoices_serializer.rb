class MerchantCustomersWithPendingInvoicesSerializer < ApplicationSerializer
  attributes :pending_invoice_customers
  def list
    object.pending_invoice_customers
  end

end
