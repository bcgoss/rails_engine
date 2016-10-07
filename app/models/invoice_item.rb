class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  before_create :record_price

  def unit_price
    '%.2f' % (self[:unit_price].to_f / 100)
  end
private
  def record_price
    self[:unit_price] = item[:unit_price]
  end
end
