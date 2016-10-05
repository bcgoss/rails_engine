namespace :import do
  require 'csv'
  desc "Import Item data from CSV"

  task items: :environment do
    CSV.foreach('./lib/data/items.csv', headers: true) do |row|
      item = Item.new(row.to_hash)
      if item.save
        print "."
      else
        print "x"
      end
    end
  end
end
