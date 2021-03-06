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


  it 'finds all transactions that match a card number' do
    create :transaction, credit_card_number: 1
    create_list :transaction, 2, credit_card_number: 2
    get '/api/v1/transactions/find_all?credit_card_number=2'

    raw_transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_transactions.count).to eq(2)
  end


  it 'returns a random transaction' do
    create :transaction, credit_card_number: 1
    get '/api/v1/transactions/random.json'

    raw_transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_transaction['credit_card_number']).to eq('1')
  end
end
