class Ledger < ActiveRecord::Base
  has_many :exchanges
  has_many :remittances

  def taxes
    result = []
    remittances.each do |remittance|
      tax_row = {remittance: remittance, tax_rate: 0.05}
      tax_row[:official_rate] = OfficialRates[remittance.transferred_at][remittance.currency]
      tax_row[:tax_base] = remittance.amount * tax_row[:official_rate]
      tax_row[:tax_amount] = tax_row[:tax_base] * tax_row[:tax_rate]
      result << tax_row
    end
    exchanges.each do |exchange|
      tax_row = {exchange: exchange, tax_rate: 0.05}
      tax_row[:official_rate] = OfficialRates[exchange.transferred_at][exchange.from_currency]
      tax_row[:tax_base] = (exchange.exchange_rate - tax_row[:official_rate]) * exchange.amount
      tax_row[:tax_base] = 0 if tax_row[:tax_base] < 0
      tax_row[:tax_amount] = tax_row[:tax_base] * tax_row[:tax_rate]
      result << tax_row
    end
    result
  end
end
