require 'rails_helper'

describe "Item CRUD API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get '/api/v1/items'
    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(3)
  end

  it "returns a single item" do
    item = create(:item, name: "pencil",
                  description: "super sweet pencil",
                  unit_price: 100)
    get "/api/v1/items/#{item.id}"
    raw_item = JSON.parse(response.body)
                  
    expect(response.status).to eq(200)
    expect(raw_item["name"]).to eq("pencil")
    expect(raw_item["description"]).to eq("super sweet pencil")
    expect(raw_item["unit_price"]).to eq(100)
  end
end
