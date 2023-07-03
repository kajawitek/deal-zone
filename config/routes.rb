# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :products, only: %i[index show create update destroy]
end
