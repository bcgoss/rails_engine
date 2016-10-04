require 'rails_helper'

describe 'Transaction CRUD Api' do
  it 'returns a list of all transactions' do
    create_list :transaction, 3

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions.count).to eq(3)
  end

  it 'returns a single transaction' do
    transactions = create :transaction, credit_card_number: '2'

    get "/api/v1/transactions/#{transactions.id}"

    raw_transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_transaction['credit_card_number']).to eq('2')
  end

  it 'finds a transaction based on card number' do
    transaction = create :transaction, credit_card_number: '2'
    get '/api/v1/transactions/find?credit_card_number=2'

    raw_transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_transaction['credit_card_number']).to eq('2')
    expect(raw_transaction['id']).to eq(transaction.id)
  end
end
