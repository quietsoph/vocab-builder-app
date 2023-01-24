class User < ApplicationRecord
  has_many :roots
  has_many :concepts, :through => :roots
end
