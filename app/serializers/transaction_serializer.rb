class TransactionSerializer < ApplicationSerializer
  attributes :credit_card_number, :id, :invoice_id, :result
end
