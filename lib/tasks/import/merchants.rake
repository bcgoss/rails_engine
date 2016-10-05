namespace :import do
  require 'csv'
  desc "Import Merchant data from CSV"

  task merchants: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      CSV.foreach('./lib/data/merchants.csv', headers: true) do |row|
        merchant = Merchant.new(row.to_hash)
        if merchant.save
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
