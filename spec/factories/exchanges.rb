# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exchange do
    ledger
    from_currency Currencies::ALL.last
    to_currency Currencies::ALL.first
    amount 1000
    exchange_rate 9000
    transferred_at { Time.now }
  end
end
