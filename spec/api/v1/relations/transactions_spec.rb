require 'rails_helper'

describe 'Transactions Relationships' do
  it "with invoices" do
    transaction = create :transaction
    create_list :invoice, 2, transactions: [transaction], status: 'shipped'

    get "/api/v1/transactions/#{transaction.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice["status"]).to eq('shipped')
  end
end
