class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  has_many :tickets
  has_many :showings,through: :tickets
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates(:password, { :length => { :in => 6..20 } })
  validates_confirmation_of :password
end
