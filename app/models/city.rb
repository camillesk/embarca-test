# frozen_string_literal: true

# Cities model logic
class City < ApplicationRecord
  # Relationships
  belongs_to :state

  # Validations
  validates :name, presence: true
end
