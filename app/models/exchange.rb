class Exchange < ActiveRecord::Base
  belongs_to :ledger

  validates :ledger, presence: true
  validates :from_currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :to_currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :amount, presence: true, numericality: true
  validates :exchange_rate, presence: true, numericality: true
  validates :transferred_at, presence: true

end
