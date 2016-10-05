namespace :import do
  require 'csv'
  desc "Import Item data from CSV"

  task items: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      starting_count = Item.count
      starting_time = Time.now
      encountered_problem = false
      CSV.foreach('./lib/data/items.csv', headers: true) do |row|
        item = Item.new(row.to_hash)
        if item.save
        else
          encountered_problem = true
        end
      end
      added_items = Item.count - starting_count
      elapsed_time = Time.now - starting_time
      puts "Loaded #{added_items} Items in #{elapsed_time}"
      if encountered_problem
        puts "A problem was encountered loading items. TODO Create a log"
      end
    ensure
      ActiveRecord::Base.record_timestamps = true  # don't forget to enable it again!
    end
  end
end

