require 'rails_helper'

describe "Invoice CRUD API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(invoices.count).to eq(3)
  end

  it "returns a single invoice" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/#{invoice.id}"
    raw_invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice["status"]).to eq("shipped")
  end

  it "finds an invoice by id" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?id=#{invoice.id}"
    raw_invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice["status"]).to eq("shipped")
    expect(raw_invoice["id"]).to eq(invoice.id)
  end
end
