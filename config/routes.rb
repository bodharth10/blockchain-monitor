# frozen_string_literal: true

Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    namespace :v1 do
      resources :unconfirmed_transactions, only: [:index]
    end
  end
end
