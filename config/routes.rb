Rails.application.routes.draw do
  apipie

  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :users, :only => [:show]

  namespace :api do
    resources :events do
      resources :messages, :except => [:update]
    end
  end
end