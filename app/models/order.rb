class Order < ApplicationRecord
    belongs_to :user

    validates_presence_of :address, :apartment, :user_id, :phoneNumber, :subtotal, :shippping, :taxes, :total

end
