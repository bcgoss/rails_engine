require 'rails_helper'

describe "Top Merchants by Revenue" do
  it "returns the top merchants, sorted by all time revenue" do
    merchant1 = create :merchant, name: "fred"
    merchant2 = create :merchant, name: "frod"
    merchant3 = create :merchant, name: "frid"

    create_list :complete_invoice, 3, merchant: merchant1
    create_list :complete_invoice, 2, merchant: merchant2
    create_list :complete_invoice, 1, merchant: merchant3

    get '/api/v1/merchants/most_items?quantity=2'
    top_merchants = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(top_merchants.first['name']).to eq("fred")
    expect(top_merchants.count).to eq(2)
  end
end
