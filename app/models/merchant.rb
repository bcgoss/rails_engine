class Merchant < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  has_many :items
  def revenue(date)
    if date
      invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).where(created_at: date).sum("invoice_items.quantity * invoice_items.unit_price")
    else
      invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end

  def self.revenue(date)
    if date
      joins(:invoices).joins(:invoice_items, :transactions).merge(Transaction.successful).where(created_at: date).sum("invoice_items.quantity * invoice_items.unit_price")
    else
      joins(:invoices).joins(:invoice_items, :transactions).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end

  def pending_invoice_customers
    # customers.joins(:invoices, :transactions).merge(Transaction.not_successful)
    # customers.joins(:invoices, :transactions).except(Transaction.successful)
    customers.find_by_sql("
      SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id = customers.id
      WHERE invoices.merchant_id = #{self.id}
      EXCEPT
      SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id = customers.id
      INNER JOIN transactions on transactions.invoice_id = invoices.id
      WHERE transactions.result = 'success'
      AND invoices.merchant_id = #{self.id}"
    )
  end

  def favorite_customer
    customers.joins(:transactions).merge(Transaction.successful).group(:id, :first_name, :last_name).order("count(customers.id) DESC").first
  end
end
