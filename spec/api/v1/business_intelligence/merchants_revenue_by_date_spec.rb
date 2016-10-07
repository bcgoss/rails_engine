require 'rails_helper'

describe "Revenue by date for all merchants" do
  it "returns the total revenue across all merchants" do
    create_list(:complete_invoice, 3, created_at: DateTime.yesterday)

    get "/api/v1/merchants/revenue?date=#{DateTime.yesterday}"
    total_revenue = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(total_revenue["total_revenue"]).to eq("27.00")
  end
end
