class UserSerializer < ActiveModel::Serializer
  # attributes :id, :first_name, :last_name, :username, :password_digest, :email
  attributes :id, :username, :first_name, :last_name, :email
end
