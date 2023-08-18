# frozen_string_literal: true

# Cities model logic
class City < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { trigram: { threshold: 0.5 } }
  pg_search_scope :search_by_state_name, associated_against: { state: :name }, using: { trigram: { threshold: 0.5 } }

  # Relationships
  belongs_to :state

  # Validations
  validates :name, presence: true
end
