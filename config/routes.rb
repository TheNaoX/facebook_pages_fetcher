Rails.application.routes.draw do
  resources :home, only: [:index]

  root to: "home#index"

  namespace :facebook do
    resources :pages, only: [:index, :create]
  end
end
