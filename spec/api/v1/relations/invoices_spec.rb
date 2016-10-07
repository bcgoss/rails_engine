require 'rails_helper'

describe 'Invoice Relationships' do
  it 'with transactions' do
    invoice = create :invoice
    create_list :transaction, 2, invoice: invoice

    get "/api/v1/invoices/#{invoice.id}/transactions"
    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions.count).to eq(2)
  end

  it 'with invoice_items' do
    invoice = create :invoice
    create_list :invoice_item, 2, invoice: invoice

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(2)
  end

  it 'with items' do
    invoice = create :invoice
    create_list :item, 2, invoices: [invoice]

    get "/api/v1/invoices/#{invoice.id}/items"
    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
  end

  it "with customer" do
    invoice = create :invoice
    create :customer, invoices: [invoice], first_name: 'Briyan'

    get "/api/v1/invoices/#{invoice.id}/customer"
    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer["first_name"]).to eq("Briyan")
  end

  it "with merchant" do
    invoice = create :invoice
    create :merchant, invoices: [invoice], name: 'Briyan'

    get "/api/v1/invoices/#{invoice.id}/merchant"
    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant["name"]).to eq("Briyan")
  end
end
