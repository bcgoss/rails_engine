class ItemSerializer < ApplicationSerializer
  attributes :description, :id, :merchant_id, :name, :unit_price
  # def unit_price
  #   number_to_currecy object.unit_price
  # end
end
