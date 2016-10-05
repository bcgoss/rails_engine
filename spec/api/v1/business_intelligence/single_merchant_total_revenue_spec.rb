require 'rails_helper'

describe "Single Merchant Total Revenue" do
  it 'returns the total revenue for a given merchant' do
    # Create merchant (id, name)
    merchant = create(:merchant, name: "Amazon")
    # Create items that correspond to this invoice (id, name, description, unit_price, merchant_id)
    item1 = create(:item, unit_price: 200, merchant_id: "#{merchant.id}")
    item2 = create(:item, unit_price: 300, merchant_id: "#{merchant.id}")
    # Create invoices for that merchant (id, cust_id, merch_id, status)
    invoice = create(:invoice, merchant_id: "#{merchant.id}", status: "shipped")
    # Create invoice items for that invoice (id, item_id, invoice_id, quantity, unit_price)
    create(:invoice_item, item_id: "#{item1.id}", invoice_id: "#{invoice.id}", quantity: 2, unit_price: 200)
    create(:invoice_item, item_id: "#{item2.id}", invoice_id: "#{invoice.id}", quantity: 2, unit_price: 300)
    # Create Transactions for the invoice (id, invoice_id, credit_card_number, credit_card_expiration_date, result)
    create(:transaction, invoice_id: "#{invoice.id}", credit_card_number: 	4654405418249631, result: "failed")
    create(:transaction, invoice_id: "#{invoice.id}", credit_card_number: 	4654405418249631, result: "success")

    get "/api/v1/merchants/#{merchant.id}/revenue"
  #  byebug
    total_revenue = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(total_revenue).to eq(1000)
  end
end
