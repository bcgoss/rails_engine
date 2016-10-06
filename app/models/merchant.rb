class Merchant < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def revenue
    invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def pending_invoice_customers
    # customers.joins(:invoices, :transactions).merge(Transaction.not_successful)
    # customers.joins(:invoices, :transactions).except(Transaction.successful)
    customers.find_by_sql("
      SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id = customers.id
      EXCEPT
      SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id = customers.id
      INNER JOIN transactions on transactions.invoice_id = invoices.id
      WHERE transactions.result = 'success'"
    )
  end
end
