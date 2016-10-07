require 'rails_helper'

describe "Revenue by date for all merchants" do
  it "returns the total revenue across all merchants" do
    pending 'DateTime matching problems'
    create_list(:complete_invoice, 3, created_at: DateTime.yesterday)

    get "/api/v1/merchants/revenue?date=#{DateTime.yesterday}"
    total_revenue = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(total_revenue["revenue"]).to eq("27.00")
  end
end
