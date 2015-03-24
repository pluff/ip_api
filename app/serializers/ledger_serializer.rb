class LedgerSerializer < ActiveModel::Serializer
  attributes :access_token, :id

  has_many :remittances, :exchanges
end
