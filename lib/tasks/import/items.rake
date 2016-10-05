namespace :import do
  require 'csv'
  desc "Import Item data from CSV"

  task items: :environment do
    ActiveRecord::Base.record_timestamps = false
    begin
      CSV.foreach('./lib/data/items.csv', headers: true) do |row|
        item = Item.new(row.to_hash)
        if item.save
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
