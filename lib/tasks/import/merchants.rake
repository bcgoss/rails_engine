namespace :import do
  require 'csv'
  desc "Import Merchant data from CSV"

  task merchants: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = Merchant.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/merchants.csv', headers: true) do |row|
        merchant = Merchant.new(row.to_hash)
        if merchant.save
        else
          encountered_problem = true
        end
      end
      added_merchants = Merchant.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{added_merchants} Merchants in #{elapsed_time}"
      if encountered_problem
        puts "A problem was encountered loading merchants. TODO Create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end

