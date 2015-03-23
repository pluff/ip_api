# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :remittance do
    ledger
    currency Currencies::ALL.last
    amount 1000
    transferred_at { Time.now }
  end
end
