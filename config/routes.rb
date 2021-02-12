Rails.application.routes.draw do
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
