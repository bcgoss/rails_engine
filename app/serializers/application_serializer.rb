class ApplicationSerializer < ActiveModel::Serializer
  def number_to_currency(number)
    "%.2f" % (number.to_f / 100)
  end
end
