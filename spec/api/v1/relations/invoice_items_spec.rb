require 'rails_helper'

describe 'Invoice Items Relationships' do
  it "with invoices" do
    invoice_item = create :invoice_item
    create_list :invoice, 2, invoice_items: [invoice_item], status: 'shipped'

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice["status"]).to eq('shipped')
  end

  it 'with items' do
    invoice_item = create :invoice_item
    create :item, invoice_items: [invoice_item], name: 'toy'

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item["name"]).to eq('toy')
  end

end
