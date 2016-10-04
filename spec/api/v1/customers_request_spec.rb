require 'rails_helper'

describe "Customer CRUD API" do
  it "returns a list of all customers" do
    create_list :customer, 3

    get '/api/v1/customers'
    customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customers.count).to eq(3)
  end
end
