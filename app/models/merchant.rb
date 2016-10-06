class Merchant < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def revenue
    invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def pending_invoice_customers
    customers.joins(:invoices, :transactions).merge(Transaction.failure)
  end
end
