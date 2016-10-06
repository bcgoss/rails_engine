FactoryGirl.define do
  factory :merchant do
    name "MyText"

    factory :merchant_with_entire_order do
      invoice_with_customer_items_and_transactions
    end

    factory :merchant_with_invoice do
      invoice

      factory :merchant_with_invoiced_items do
        transient do
          item_count 3
        end

        after(:create) do |merchant, evaluator|
          create_list(
            :merchant,
            evaluator.item_count,
            invoice_item:  invoice_item
          )
        end
      end
    end

    factory :merchant_with_items do
      #is this for items or invoice items?
      transient do
        item_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(
          :merchant,
          evaluator.item_count,
          item:  item
        )
      end
    end
  end
end
