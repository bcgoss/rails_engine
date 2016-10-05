namespace :import do
  require 'csv'
  desc "Import Customer data from CSV"

  task customers: :environment do
    CSV.foreach('./lib/data/customers.csv', headers: true) do |row|
      customer = Customer.new(row.to_hash)
      if customer.save
        print "."
      else
        print "x"
      end
    end
  end
end
