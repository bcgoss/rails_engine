class MerchantRevenueSerializer < ApplicationSerializer
  attributes :revenue
  def revenue
    number_to_currency object
  end
end
