FactoryGirl.define do
  factory :invoice_item do
    quantity 1
    item
    invoice
  end
end
