require 'rails_helper'

describe 'Customer Relationships' do
  it "with invoices" do
    customer = create :customer
    create_list :invoice, 2, customer: customer

    get "/api/v1/customers/#{customer.id}/invoices"
    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(2)
  end

  it 'with transactions' do
    customer = create :customer
    create_list :complete_invoice, 2, customer: customer

    get "/api/v1/customers/#{customer.id}/transactions"
    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions.count).to eq(2)
  end
end
