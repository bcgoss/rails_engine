require 'rails_helper'

describe 'Merchant CRUD API' do
  it 'returns a list of merchants' do
    create_list(:merchant, 3)
    get '/api/v1/merchants'
    merchants = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(merchants.count).to eq(3)
  end
end
