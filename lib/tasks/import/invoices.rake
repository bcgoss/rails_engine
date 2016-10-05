namespace :import do
  require 'csv'
  desc "Import Invoice data from CSV"

  task invoices: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      CSV.foreach('./lib/data/invoices.csv', headers: true) do |row|
        invoice = Invoice.new(row.to_hash)
        if invoice.save
          print "."
        else
          print "x"
        end
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end
