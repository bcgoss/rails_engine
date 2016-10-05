require 'rails_helper'

describe "Customer CRUD API" do
  it "returns a list of all customers" do
    create_list :customer, 3

    get '/api/v1/customers'
    customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customers.count).to eq(3)
  end

  it "returns a single customer" do
    customer = create :customer, first_name: "Brian"

    get "/api/v1/customers/#{customer.id}"
    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer["first_name"]).to eq("Brian")
  end

  it "finds a customer by name" do
    create :customer
    create :customer, first_name: 'Bryan'

    get '/api/v1/customers/find?first_name=Bryan'

    raw_customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_customer["first_name"]).to eq('Bryan')
  end

  it "finds all customers by name" do
    create_list :customer, 2, first_name: 'Bryan'
    create :customer

    get '/api/v1/customers/find_all?first_name=Bryan'

    raw_customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_customers.count).to eq(2)
  end

  it "returns a random customer" do
    create_list :customer, 2

    get '/api/v1/customers/random.json'

    raw_customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_customer["first_name"]).to_not be_empty
  end
end
