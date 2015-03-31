class RemittanceSerializer < ActiveModel::Serializer
  attributes :id, :currency, :amount, :transferred_at, :taxes, :url

  def transferred_at
    object.transferred_at.try :to_date
  end

  def url
    "/api/v1/ledgers/#{object.ledger.to_param}/remittances/#{object.to_param}"
  end
end
