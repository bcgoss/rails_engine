require 'rails_helper'

describe "Invoice CRUD API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(invoices.count).to eq(3)	
  end

end

