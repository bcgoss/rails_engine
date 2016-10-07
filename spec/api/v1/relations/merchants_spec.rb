require 'rails_helper'

describe 'Merchant Relationships' do
  it 'with items' do
    merchant = create :merchant
    create_list :item, 2, merchant: merchant

    get "/api/v1/merchants/#{merchant.id}/items"
    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
  end

  it "with invoices" do
    merchant = create :merchant
    create_list :invoice, 2, merchant: merchant

    get "/api/v1/merchants/#{merchant.id}/invoices"
    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(2)
  end

end
