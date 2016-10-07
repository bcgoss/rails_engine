require 'rails_helper'

describe 'Items Relationships' do
  it 'with invoice_items' do
    item = create :item
    create_list :invoice_item, 2, item: item

    get "/api/v1/items/#{item.id}/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(2)
  end

  it "with merchant" do
    item = create :item
    create :merchant, items: [item], name: 'Briyan'

    get "/api/v1/items/#{item.id}/merchant"
    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant["name"]).to eq("Briyan")
  end
end
