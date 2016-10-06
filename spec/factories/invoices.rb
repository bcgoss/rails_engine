FactoryGirl.define do
  factory :invoice do
    status "MyText"

    factory :invoice_with_merchant do
      merchant
    end

    factory :invoice_with_customer do
      customer

      factory :invoice_with_customer_items_and_transactions do
        transient do
          transaction_count 2
          item_count 2
        end
        after :create do |invoice, evaluator|
          create_list(
            :transaction,
            evaluator.transaction_count,
            invoice: invoice
          )
          create_list(
            :item,
            evaluator.item_count,
            invoices: [invoice]
          )
        end
      end
    end

    factory :invoice_with_transaction do
      transaction
    end

    factory :invoice_with_transactions do
      transient do
        transaction_count 2
      end
      after :create do |invoice, evaluator|
        create_list(
          :transaction,
          evaluator.transaction_count,
          invoice: invoice
        )
      end
    end

    factory :invoice_merchant_and_customer do
      merchant
      customer

      factory :invoice_with_merchant_customer_and_items do
        transient do
          item_count 3
        end

        after(:create) do |invoice, evaluator|
          items = create_list(
          :item,
          evaluator.item_count
          )
          items.each do |item|
            create_list(
            :invoice_item,
            evaluator.item_count,
            invoice: invoice,
            item: item
            )
          end
        end

        factory :complete_invoice do
          transient do
            transaction_count 2
          end

          after(:create) do |invoice, evaluator|
            create_list(
              :transaction,
              evaluator.transaction_count,
              invoice: invoice
            )
          end
        end
      end
    end
  end
end
