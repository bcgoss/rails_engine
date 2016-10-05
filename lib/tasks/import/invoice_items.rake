namespace :import do
  require 'csv'
  desc "Import Invoice Item data from CSV"

  task invoice_items: :environment do
    CSV.foreach('./lib/data/invoice_items.csv', headers: true) do |row|
      invoice_item = InvoiceItem.new(row.to_hash)
      if invoice_item.save
        print "."
      else
        print "x"
      end
    end
  end
end
