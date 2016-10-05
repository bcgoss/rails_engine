class Item < ApplicationRecord
  def unit_price
    '%.2f' % (self[:unit_price].to_f / 100)
  end
end
