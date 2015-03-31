class LedgerSerializer < ActiveModel::Serializer
  attributes :access_token, :id, :url

  has_many :remittances, :exchanges

  def url
    "/api/v1/ledgers/#{object.to_param}/"
  end
end
