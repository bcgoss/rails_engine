namespace :import do
  require 'csv'
  desc "Import Invoice data from CSV"

  task invoices: :environment do
    CSV.foreach('./lib/data/invoices.csv', headers: true) do |row|
      invoice = Invoice.new(row.to_hash)
      if invoice.save
        print "."
      else
        print "x"
      end
    end
  end
end
