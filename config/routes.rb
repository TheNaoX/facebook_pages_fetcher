Rails.application.routes.draw do
  devise_for :users, only: [ :omniauth_callbacks, :sessions ]

  resources :home, only: [:index]

  root to: "home#index"

  namespace :facebook do
    resources :pages, only: [:index, :create, :show] do
      resources :posts, only: [:index]
    end
  end
end
