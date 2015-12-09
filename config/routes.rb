Rails.application.routes.draw do
  apipie

  root to: 'home#index'

  # resources :users
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :users, :only => [:show]

  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  # namespace :api do
  #   resources :events do
  #     resources :messages
  #   end
  # end
end