class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :amount, :exchange_rate, :from_currency, :to_currency, :transferred_at, :taxes
end
