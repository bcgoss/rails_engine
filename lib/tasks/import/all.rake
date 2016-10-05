namespace :import do
  desc "Import all six CSV files"

  task all: [:merchants, :items, :customers, :invoices, :transactions, :invoice_items]
end
