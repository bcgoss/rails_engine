class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> {where(result: 'success')}
  scope :failure, -> {where(result: 'failed')}
end
