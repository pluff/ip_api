class Exchange < ActiveRecord::Base
  belongs_to :ledger

  validates :ledger, presence: true
  validates :from_currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :to_currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :amount, presence: true, numericality: true
  validates :exchange_rate, presence: true, numericality: true
  validates :transferred_at, presence: true

  def taxes
    tax_row = {tax_rate: 0.05}
    tax_row[:official_rate] = OfficialRates[transferred_at][from_currency]
    tax_row[:tax_base] = (exchange_rate - tax_row[:official_rate]) * amount
    tax_row[:tax_base] = 0 if tax_row[:tax_base] < 0
    tax_row[:tax_amount] = tax_row[:tax_base] * tax_row[:tax_rate]
    tax_row
  end
end
