class Root < ApplicationRecord
  belongs_to :user, :optional => true
  has_and_belongs_to_many :concepts

  # scope :search_roots, -> { where("text LIKE ?", Root.sanitize_sql_like(params[:query]) + "%") }
end
