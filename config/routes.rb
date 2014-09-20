Rails.application.routes.draw do
  resources :home, only: [:index]

  root to: "home#index"

  namespace :facebook do
    resources :pages, only: [:create]
  end
end
