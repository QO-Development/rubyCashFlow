class Transaction < ApplicationRecord
  validates :date, :description, :amount, presence: true
end
