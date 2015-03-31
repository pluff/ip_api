class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :amount, :exchange_rate, :from_currency, :to_currency, :transferred_at, :taxes, :url

  def transferred_at
    object.transferred_at.try :to_date
  end

  def url
    "/api/v1/ledgers/#{object.ledger.to_param}/exchanges/#{object.to_param}"
  end
end
