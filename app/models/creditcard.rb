class Creditcard < ApplicationRecord
    belongs_to :user

    validates_presence_of :creditCardNumber, :zipcode, :cvc, :expirationMonth, :expirationYear, :name, :user_id

end
