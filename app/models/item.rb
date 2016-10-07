class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  belongs_to :merchant
  def unit_price
    '%.2f' % (self[:unit_price].to_f / 100)
  end

  def self.most_revenue(quantity = 1)
    joins(:invoice_items, invoices: :transactions).merge(Transaction.successful).group(:id).order("sum(invoice_items.unit_price * invoice_items.quantity) desc").limit(quantity)
  end

  def self.most_items(quantity = 1)
    joins(:invoice_items, invoices: :transactions).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity) desc").limit(quantity)
  end

  def best_day
    invoices.joins(:invoice_items, :transactions).merge(Transaction.successful).group(:created_at).order('sum(invoice_items.quantity) desc').pluck(:created_at).first

    # invoice_items.joins(invoice: :transactions).merge(Transaction.successful).group("invoice_items.created_at").order("sum(invoice_items.quantity) desc")
  end
end
