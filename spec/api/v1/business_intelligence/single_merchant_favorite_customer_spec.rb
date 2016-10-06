require 'rails_helper'

describe "Favorite Customer by Merchant" do
  it "returns the customer with the most successful transactions for a merchant" do
    merchant = create :merchant
    customer1 = create :customer, first_name: "Tim"
    customer2 = create :customer
    create :complete_invoice, customer: customer1, merchant: merchant
    create :complete_invoice, customer: customer1, merchant: merchant
    create :complete_invoice, customer: customer2, merchant: merchant

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    favorite_customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(favorite_customer["first_name"]).to eq("Tim")
  end
end
