FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyText"
    credit_card_expiration_date "MyText"
    result "success"
    invoice
  end
end
