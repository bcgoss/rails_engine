FactoryGirl.define do
  factory :invoice do
    status "MyText"

    factory :invoice_with_merchant do
      #this factory creates an invoice with a merchant. No cust or anything else
      merchant
    end
# For the most part it makes sense, make an invoice, create a merchant, then add a customer, then add in some transactionser the inner most nestings happen
    factory :invoice_with_customer do
      #this factory creates an invoice iwth a customer, but no merchant. that was the error I thought I saw
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
          invoice.merchant.items << invoice.items
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

      factory :complete_invoice do
        transient do
          item_count 3
        end

        after(:create) do |invoice, evaluator|
          create_list(
            :invoice_item,
            evaluator.item_count,
            invoice: invoice)
        end
      end
    end
  end
end
