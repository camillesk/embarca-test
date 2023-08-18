# frozen_string_literal: true

# States model logic
class State < ApplicationRecord
  # Relationships
  has_many :cities, dependent: :destroy

  # Validations
  validates :name, presence: true
end
