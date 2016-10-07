class InvoiceSerializer < ApplicationSerializer
  attributes :customer_id, :id, :merchant_id, :status
end
