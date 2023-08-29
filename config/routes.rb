# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :products
  resources :orders, only: %i[index new create]
end
