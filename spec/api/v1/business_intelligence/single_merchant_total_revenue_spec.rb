require 'rails_helper'

describe "Single Merchant Total Revenue" do
  it 'returns the total revenue for a given merchant' do
    # Create merchant (id, name)
    merchant = create(:merchant, name: "Amazon")
    # Create items that correspond to this invoice (id, name, description, unit_price, merchant_id)
    create_list(:item, 5, unit_price: 200, merchant_id: 1)
    # Create invoices for that merchant (id, cust_id, merch_id, status)
    create_list(:invoice, 2, merchant_id: 1, status: "shipped")
    # Create invoice items for that invoice (id, item_id, invoice_id, quantity, unit_price)
    create(:invoice_item, item_id: 1, invoice_id: 1, quantity: 1, unit_price: 200)
    create(:invoice_item, item_id: 2, invoice_id: 1, quantity: 1, unit_price: 200)
    create(:invoice_item, item_id: 3, invoice_id: 2, quantity: 1, unit_price: 200)
    create(:invoice_item, item_id: 4, invoice_id: 2, quantity: 1, unit_price: 200)
    create(:invoice_item, item_id: 5, invoice_id: 2, quantity: 1, unit_price: 200)

    get "/api/v1/merchants/#{merchant.id}/revenue"
    total_revenue = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(total_revenue).to eq(1000)
  end
end
