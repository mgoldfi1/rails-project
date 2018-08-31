class User < ActiveRecord::Base
  has_many :tickets
  has_many :showings,through: :tickets
  has_secure_password
end
