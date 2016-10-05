require 'rails_helper'

describe 'Merchant CRUD API' do
  it 'returns a list of merchants' do
    create_list(:merchant, 3)
    get '/api/v1/merchants'
    merchants = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(merchants.count).to eq(3)
  end

  it 'returns a single merchant' do
    merchant = create :merchant, name: 'Test Merchant'
    get "/api/v1/merchants/#{merchant.id}"
    raw_merchant = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(raw_merchant["name"]).to eq("Test Merchant")
  end

  it 'finds an merchant by quantity' do
    create :merchant, name: 'Foo'

    get '/api/v1/merchants/find?name=Foo'

    raw_merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_merchant["name"]).to eq('Foo')
  end

  it 'finds all merchants by quantity' do
    create_list :merchant, 2, name: 'Foo'
    create :merchant

    get '/api/v1/merchants/find_all?name=Foo'

    raw_merchants = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_merchants.count).to eq(2)
  end

  it 'finds a random merchant' do
    create_list :merchant, 2

    get '/api/v1/merchants/random.json'

    raw_merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_merchant["name"]).to be_an(String)
  end
end
