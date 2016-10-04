class Api::V1::Transactions::SearchController < ApplicationController
  def find
    render json: Transaction.find_by(transaction_params)
  end

  def find_all
    render json: Transaction.where(transaction_params)
  end

  private
  def transaction_params
    params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result)
  end
end
