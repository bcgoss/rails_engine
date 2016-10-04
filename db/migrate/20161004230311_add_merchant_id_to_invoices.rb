class AddMerchantIdToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :merchant, foreign_key: true
  end
end
