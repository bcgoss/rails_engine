class InvoiceItemSerializer < ApplicationSerializer
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price
  # def unit_price
  #   number_to_currecy object.unit_price
  # end
end
