class MerchantFavoriteCustomerSerializer < ActiveModel::Serializer
  attributes :favorite_customer
  def favorite_customer
    object.favorite_customer
  end
end
