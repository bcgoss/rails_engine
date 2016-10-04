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


  it "finds an invoice by status" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?status=shipped"
    raw_invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice["status"]).to eq("shipped")
    expect(raw_invoice["id"]).to eq(invoice.id)
  end

  it "finds all invoices by status" do
    create_list(:invoice, 2, status: "shipped")
    create(:invoice, status: "pending")
    get "/api/v1/invoices/find_all?status=shipped"
    raw_invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoices.count).to eq(2)
  end
end
