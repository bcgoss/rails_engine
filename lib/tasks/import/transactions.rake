namespace :import do
  require 'csv'
  desc "Import Transaction data from CSV"

  task transactions: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = Transaction.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/transactions.csv', headers: true) do |row|
        transaction = Transaction.new(row.to_hash)
        if transaction.save
        else
          encountered_problem = true
        end
      end
      added_transactions = Transaction.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{added_transactions} Transactions in #{elapsed_time}"
      if encountered_problem
        puts "A problem was encountered loading transactions. TODO Create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end

