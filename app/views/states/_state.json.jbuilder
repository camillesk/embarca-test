# frozen_string_literal: true

json.extract! state, :id, :name, :population, :created_at, :updated_at
json.url state_url(state, format: :json)
