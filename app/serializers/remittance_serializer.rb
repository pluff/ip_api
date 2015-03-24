class RemittanceSerializer < ActiveModel::Serializer
  attributes :id, :currency, :amount, :transferred_at, :taxes
end
