class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :apartment, :user_id, :phoneNumber, :subtotal, :shippping, :taxes, :total
end
