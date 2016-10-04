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
end
