require 'rails_helper'

describe "Single Merchant Total Revenue" do
  it 'returns the total revenue for a given merchant' do
    merchant = create :merchant
    invoice1 = create :complete_invoice, merchant: merchant
    get "/api/v1/merchants/#{merchant.id}/revenue"
    total_revenue = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(total_revenue["revenue"]).to eq("9.00")
  end
end
