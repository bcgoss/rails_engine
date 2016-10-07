namespace :import do
  require 'csv'
  desc "Import Invoice Item data from CSV"

  task invoice_items: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = InvoiceItem.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/invoice_items.csv', headers: true) do |row|
        invoice_item = InvoiceItem.new(row.to_hash)
        if invoice_item.save
        else
          encountered_problem = true
        end
      end
      invoice_items_added = InvoiceItem.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{invoice_items_added} Invoice Items in #{elapsed_time}"
      if encountered_problem
        puts "Problems encountered while loading Invoice Items. TODO create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end
