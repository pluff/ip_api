class Remittance < ActiveRecord::Base
  validates :currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :amount, presence: true, numericality: true
  validates :transferred_at, presence: true

  belongs_to :ledger

  validates :ledger, presence: true
end
