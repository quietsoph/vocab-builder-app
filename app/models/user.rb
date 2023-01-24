class User < ApplicationRecord

  has_secure_password

  validates :email, :uniqueness => true, :presence => true

  has_many :roots
  has_many :concepts, :through => :roots
end
