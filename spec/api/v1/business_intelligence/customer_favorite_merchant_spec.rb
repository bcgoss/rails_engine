require 'rails_helper'

describe "Customer's Favorite Merchant" do 
  it "returns a merchant with whom the customer has had the most successful transactions" do
    customer = create :customer
    merchant1 = create :merchant, name: "Chipotle"
    merchant2 = create :merchant

    create_list :complete_invoice, 3, customer: customer, merchant: merchant1
    create :complete_invoice, customer: customer, merchant: merchant2

    get "/api/v1/customers/#{customer.id}/favorite_merchant"
    raw_merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_merchant["name"]).to eq("Chipotle")
  end 
end
