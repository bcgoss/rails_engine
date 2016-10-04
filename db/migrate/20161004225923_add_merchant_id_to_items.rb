class AddMerchantIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :merchant, foreign_key: true
  end
end
