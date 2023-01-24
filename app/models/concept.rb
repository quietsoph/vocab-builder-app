class Concept < ApplicationRecord
  has_and_belongs_to_many :roots
  belongs_to :category, :optional => true

  has_many :linkages
  has_many :linking_concepts, through: :linkages
end
