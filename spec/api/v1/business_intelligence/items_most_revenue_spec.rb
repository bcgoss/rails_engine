require 'rails_helper'

describe "Item, most by revenue" do
  it "returns the top x items" do
    cool_item = create :item, name: "cool toy"
    lame_item = create :item, name: 'lame junk'
    create_list :invoice, 10, items: [cool_item]
    create :invoice, items: [lame_item]

    get '/api/v1/items/most_revenue?quantity=2'
    items = JSON.parse(response.body)

    expect(reponse.status).to eq(200)
    expect(items.count).to eq(2)
    expect(items.first["name"]).to eq("cool toy")
  end
end
