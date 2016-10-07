class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  belongs_to :merchant
  def unit_price
    '%.2f' % (self[:unit_price].to_f / 100)
  end
end
