class Api::V1::Transactions::RelationsController < ApplicationController
  def invoice
    render json: Transaction.find(params[:id]).invoice
  end
end
