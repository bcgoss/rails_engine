class MerchantsTotalRevenueSerializer < ApplicationSerializer
  attributes :total_revenue
  def total_revenue
    number_to_currency object
  end
end
