namespace :import do
  require 'csv'
  desc "Import Invoice data from CSV"

  task invoices: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = Invoice.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/invoices.csv', headers: true) do |row|
        invoice = Invoice.new(row.to_hash)
        if invoice.save
        else
          encountered_problem = true
        end
      end
      added_invoices = Invoice.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{added_invoices} Invoices in #{elapsed_time}"
      if encountered_problem
        puts "A problem was encountered loading invoices. TODO Create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end

