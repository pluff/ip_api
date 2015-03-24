class Remittance < ActiveRecord::Base
  validates :currency, presence: true, inclusion: {in: Currencies::ALL}
  validates :amount, presence: true, numericality: true
  validates :transferred_at, presence: true

  belongs_to :ledger

  validates :ledger, presence: true

  def taxes
    tax = {
      tax_rate: 0.05,
      official_rate: OfficialRates[transferred_at][currency]
    }
    tax[:tax_base] = amount * tax[:official_rate]
    tax[:tax_amount] = tax[:tax_base] * tax[:tax_rate]
    tax
  end
end
