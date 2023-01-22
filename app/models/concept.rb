class Concept < ApplicationRecord
  has_and_belongs_to_many :roots
  belongs_to :category, :optional => true
end
