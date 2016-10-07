require 'rails_helper'

describe "Item, most by revenue" do
  it "returns the top x items" do
    cool_item = create :item, name: "cool toy"
    lame_item = create :item, name: 'lame junk'
    create :item, name: 'unknown item'

    create_list :complete_invoice, 10, items: [cool_item]
    create :complete_invoice, items: [lame_item]

    get '/api/v1/items/most_revenue?quantity=2'
    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
    expect(items.first["name"]).to eq("cool toy")
    expect(itmes.last["name"]).to eq('lame junk')
  end
end
