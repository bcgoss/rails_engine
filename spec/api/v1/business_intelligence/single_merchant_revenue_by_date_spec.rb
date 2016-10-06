require 'rails_helper'

describe 'Merchant Revenue by Date' do
  it 'returns total revenue on a given date' do
    merchant = create :merchant
    invoice1 = create :complete_invoice, merchant: merchant, created_at: Date.yesterday
    invoice2 = create :complete_invoice, merchant: merchant, created_at: Date.yesterday.prev_day
    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{Date.yesterday}"

    revenue = JSON.parse(response.body)
    expect(revenue["revenue"]).to eq("9.00")
  end
end
