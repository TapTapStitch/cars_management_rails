# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'help' => 'pages#help'
  resources :cars do
    collection do
      get :search
      get :user_searches
    end
  end
end
