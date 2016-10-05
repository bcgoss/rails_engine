namespace :import do
  require 'csv'
  desc "Import Merchant data from CSV"

  task merchants: :environment do
    CSV.foreach('./lib/data/merchants.csv', headers: true) do |row|
      merchant = Merchant.new(row.to_hash)
      if merchant.save
        print "."
      else
        print "x"
      end
    end
  end
end
