class Linkage < ApplicationRecord
  belongs_to :concept

  belongs_to :linking_concept, class_name: 'Concept'

  belongs_to :relation, :optional => true
end
