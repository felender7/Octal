require 'sidekiq/web'

Rails.application.routes.draw do
  get '/shop', to: 'shop#index'
  resources :supports
  get 'users/index'
  get 'users/show'
  get '/support' ,to: 'support#index'
  get '/resource',to: 'resource#index'

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  resources :succours
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: "users#index"
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, :path_prefix => 'd', controllers: {confirmations: 'confirmations' }
  resources :users, :only =>[:show]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
