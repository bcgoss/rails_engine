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

  it 'finds an item by quantity' do
    create :item, name: 'Foo'

    get '/api/v1/items/find?name=Foo'

    raw_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_item["name"]).to eq('Foo')
  end

  it 'finds all items by quantity' do
    create_list :item, 2, name: 'Foo'
    create :item

    get '/api/v1/items/find_all?name=Foo'

    raw_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_items.count).to eq(2)
  end

  it 'finds a random item' do
    create_list :item, 2

    get '/api/v1/items/random.json'

    raw_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_item["name"]).to be_an(String)
  end
end
