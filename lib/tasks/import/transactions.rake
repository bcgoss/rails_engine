namespace :import do
  require 'csv'
  desc "Import Transaction data from CSV"

  task transactions: :environment do
    CSV.foreach('./lib/data/transactions.csv', headers: true) do |row|
      transaction = Transaction.new(row.to_hash)
      if transaction.save
        print "."
      else
        print "x"
      end
    end
  end
end

