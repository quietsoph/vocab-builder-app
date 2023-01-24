class User < ApplicationRecord

  has_secure_password

  validates :password, :uniqueness => true, :presence => true

  has_many :roots
  has_many :concepts, :through => :roots
end
