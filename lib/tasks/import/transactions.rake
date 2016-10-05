namespace :import do
  require 'csv'
  desc "Import Transaction data from CSV"

  task transactions: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      CSV.foreach('./lib/data/transactions.csv', headers: true) do |row|
        transaction = Transaction.new(row.to_hash)
        if transaction.save
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
