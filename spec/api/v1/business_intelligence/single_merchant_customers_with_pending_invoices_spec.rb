require 'rails_helper'

describe "Single Merchant Customers With Pending Invoices" do
  it "returns customers that have pending(unpaid) invoices for that merchant" do
    merchant = create(:merchant, name: "Amazon")
    item = create(:item, unit_price: 200, merchant_id: "#{merchant.id}")

    customer1 = create(:customer, first_name: "Shady", last_name: "McShaderson")
    customer2 = create(:customer, first_name: "Sketchy", last_name: "McSketcherson")
    customer3 = create(:customer, first_name: "Joe", last_name: "Cool")

    invoice1 = create(:invoice, merchant_id: "#{merchant.id}", customer_id: "#{customer1.id}")
    invoice2 = create(:invoice, merchant_id: "#{merchant.id}", customer_id: "#{customer2.id}")
    invoice3 = create(:invoice, merchant_id: "#{merchant.id}", customer_id: "#{customer3.id}")

    create(:invoice_item, item_id: "#{item.id}", invoice_id: "#{invoice1.id}", quantity: 2, unit_price: 200)
    create(:invoice_item, item_id: "#{item.id}", invoice_id: "#{invoice2.id}", quantity: 2, unit_price: 200)
    create(:invoice_item, item_id: "#{item.id}", invoice_id: "#{invoice3.id}", quantity: 2, unit_price: 200)

    create(:transaction, invoice_id: "#{invoice1.id}", credit_card_number: 	4654405418249631, result: "failed")
    create(:transaction, invoice_id: "#{invoice2.id}", credit_card_number: 	4654405418249631, result: "failed")
    create(:transaction, invoice_id: "#{invoice3.id}", credit_card_number: 	4654405418249631, result: "success")

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    pending_customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(pending_customers.count).to eq(2)
    expect(pending_customers.pluck("id")).to include(customer1.id)
    expect(pending_customers.pluck("id")).to include(customer2.id)
  end
end
