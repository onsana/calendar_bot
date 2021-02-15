require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  namespace :admin do
    resources :events do
      member do
        get 'toggle_publish'
      end
      collection do
        get 'calendar'
      end
    end
    root to: 'dashboard#index'
  end

  resources :events
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  root to: 'pages#home'
end
