# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get 'help' => 'pages#help'
  resources :cars do
    collection do
      get :search
    end
  end
end
