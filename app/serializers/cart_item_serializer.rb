class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :user_id
end
