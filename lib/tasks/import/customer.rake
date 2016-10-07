namespace :import do
  require 'csv'
  desc "Import Customer data from CSV"

  task customers: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = Customer.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/customers.csv', headers: true) do |row|
        customer = Customer.new(row.to_hash)
        if customer.save
        else
          encountered_problem = true
        end
      end
      added_customers = Customer.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{added_customers} Customers in #{elapsed_time}"
      if encountered_problem
        puts "A problem was encountered loading customers. TODO Create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end
