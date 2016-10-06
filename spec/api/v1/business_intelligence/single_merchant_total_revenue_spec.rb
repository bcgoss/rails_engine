require 'rails_helper'

describe "Single Merchant Total Revenue" do
  it 'returns the total revenue for a given merchant' do
    # Create merchant (id, name)
    # merchant = create(:merchant, name: "Amazon")
    # # Create items that correspond to this invoice (id, name, description, unit_price, merchant_id)
    # item1 = create(:item, unit_price: 200, merchant_id: "#{merchant.id}")
    # item2 = create(:item, unit_price: 300, merchant_id: "#{merchant.id}")
    #
    # customer = create(:customer)
    # # Create invoices for that merchant (id, cust_id, merch_id, status)
    # invoice = create(:invoice, merchant_id: "#{merchant.id}", customer_id: "#{customer.id}")
    # # Create invoice items for that invoice (id, item_id, invoice_id, quantity, unit_price)
    # create(:invoice_item, item_id: "#{item1.id}", invoice_id: "#{invoice.id}", quantity: 2, unit_price: 200)
    # create(:invoice_item, item_id: "#{item2.id}", invoice_id: "#{invoice.id}", quantity: 2, unit_price: 300)
    # # Create Transactions for the invoice (id, invoice_id, credit_card_number, credit_card_expiration_date, result)
    # create(:transaction, invoice_id: "#{invoice.id}", credit_card_number: 	4654405418249631, result: "failed")
    # create(:transaction, invoice_id: "#{invoice.id}", credit_card_number: 	4654405418249631, result: "success")
    # merchant = create :merchant_with_entire_order
    merchant = create :merchant
    create :invoice_with_customer_items_and_transactions, merchant: merchant
    get "/api/v1/merchants/#{merchant.id}/revenue"
    total_revenue = JSON.parse(response.body)
byebug
    expect(response.status).to eq(200)
    expect(total_revenue["revenue"]).to eq("10.00")
  end
end
