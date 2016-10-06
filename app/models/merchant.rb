class Merchant < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices

  has_many :items
  def revenue
    invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
