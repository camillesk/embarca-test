# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cities
  get '/search_cities', to: 'cities#new_search'
  post '/search_cities', to: 'cities#search'

  resources :states
end
