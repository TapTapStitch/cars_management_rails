# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  resources :cars
  get 'help' => 'pages#help'
  get 'cars_search' => 'cars#search'
end
