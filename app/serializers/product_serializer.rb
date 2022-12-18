class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :color, :image, :category_id, :price
end
