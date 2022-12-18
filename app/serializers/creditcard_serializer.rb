class CreditcardSerializer < ActiveModel::Serializer
  attributes :id, :creditCardNumber, :zipcode, :cvc, :expirationMonth, :expirationYear, :name, :user_id
end
