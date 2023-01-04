class Product < ApplicationRecord
    belongs_to :category 

    has_one :cart_items
    has_many :users, through: :cart_items

    validates_presence_of :name, :description, :color, :image, :category_id, :price 
end
