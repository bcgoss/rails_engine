require 'rails_helper'

describe 'Item best day' do
  it 'returns the date of the most sold for item' do
    item = create :item
    create_list :complete_invoice, 3, items: [item], created_at: Date.yesterday
    create :complete_invoice, items: [item], created_at: Date.yesterday.prev_day

    get "/api/v1/items/#{item.id}/best_day"
    date = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(date).to eq(Date.yesterday)
  end
end
