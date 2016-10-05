class Api::V1::Customers::SearchController < ApplicationController
  def find
    render json: Customer.find_by(customer_params)    
  end

  def find_all
    render json: Customer.where(customer_params)
  end

  def random
    render json: Customer.random
  end
private
  def customer_params
    params.permit(:id, :first_name, :last_name, :invoice_id, :create_at, :updated_at)
  end
end
