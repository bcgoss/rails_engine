class AddCustomerIdToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :customer, foreign_key: true
  end
end
