class Family < ApplicationRecord
  belongs_to :user, :optional => true
  has_and_belongs_to_many :concepts, join_table: :concepts_families, foreign_key: :family_id, association_foreign_key: :concept_id

  # scope :search_roots, -> { where("text LIKE ?", Root.sanitize_sql_like(params[:query]) + "%") }
end
