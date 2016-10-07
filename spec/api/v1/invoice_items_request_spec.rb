require 'rails_helper'

describe "Invoice Item CRUD API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)
    get '/api/v1/invoice_items'
    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(3)
  end

  it "returns a single invoice item" do
    invoice_item = create(:invoice_item, quantity: 7)
    get "/api/v1/invoice_items/#{invoice_item.id}"
    raw_invoice_item = JSON.parse(response.body)
    
    expect(response.status).to eq(200)
    expect(raw_invoice_item["quantity"]).to eq(7)
  end

  it 'finds an invoice item by quantity' do
    create :invoice_item, quantity: 7

    get '/api/v1/invoice_items/find?quantity=7'

    raw_invoice_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice_item["quantity"]).to eq(7)
  end

  it 'finds all invoice items by quantity' do
    create_list :invoice_item, 2, quantity: 7
    create :invoice_item

    get '/api/v1/invoice_items/find_all?quantity=7'

    raw_invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice_items.count).to eq(2)
  end

  it 'finds a random invoice item' do
    create_list :invoice_item, 2

    get '/api/v1/invoice_items/random.json'

    raw_invoice_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice_item["quantity"]).to be_an(Integer)
  end
end
